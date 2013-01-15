module BrowserId
  module ViewHelpers
    def browserid_js_tag(params = {})
      javascript_include_tag(browserid_js_include_url, params)
    end

    def browserid_js_include_url
      "https://#{Devise::Strategies::BrowseridAuthenticatable.browserid_url}/include.js"
    end
  end
end
