module BrowserId
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Install browser_id'
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template 'devise_browserid.rb', 'config/initializers/browser_id.rb'
      end
    end
  end
end
