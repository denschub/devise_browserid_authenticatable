require 'devise/strategies/base'
require 'net/https'

class Devise::Strategies::BrowseridAuthenticatable < Devise::Strategies::Authenticatable
  def valid?
    unless params[:assertion]
      return false
    end

    http = Net::HTTP.new(Devise::Strategies::BrowseridAuthenticatable.browserid_url, 443)
    http.use_ssl = true

    verification_request = Net::HTTP::Post.new("/verify")
    verification_request.set_form_data(assertion: params[:assertion], audience: request.host_with_port)

    response = http.request(verification_request)
    @asserted = JSON.parse(response.body)

    (@asserted["status"] == "okay") and (@asserted["audience"] == request.host_with_port)
  end

  def authenticate!
    u = mapping.to.find_by_email(@asserted["email"])

    unless u
      password = Devise.friendly_token
      u = mapping.to.new(:email => @asserted["email"], :password => password, :password_confirmation => password)
      u.skip_confirmation! if u.respond_to?(:skip_confirmation!)
      u.save!
    end

    success!(u)
  end

  def self.browserid_url
    if Rails.env.production?
      "login.persona.org"
    else
      "login.dev.anosrep.org"
    end
  end
end

Warden::Strategies.add :browserid_authenticatable, Devise::Strategies::BrowseridAuthenticatable
