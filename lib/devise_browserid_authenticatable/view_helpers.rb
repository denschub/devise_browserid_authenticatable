module BrowserId
  module ViewHelpers
    def browserid_js_tag
      javascript_include_tag(include_js_url)
    end

    def include_js_url
      "https://#{Devise::Strategies::BrowseridAuthenticatable.browserid_url}/include.js"
    end
  end
end