require "devise_browserid_authenticatable/view_helpers"

module BrowserId
  class Railtie < Rails::Railtie
    initializer "browser_id.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end