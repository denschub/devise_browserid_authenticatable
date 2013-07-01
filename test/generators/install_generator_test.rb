require 'test_helper'
require 'rails/generators/test_case'
require 'generators/browser_id/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests BrowserId::Generators::InstallGenerator
  destination File.expand_path('../../tmp', __FILE__ )
  setup :prepare_destination

  test 'create initializer' do
    run_generator

    assert_file "config/initializers/browser_id.rb"
  end
end
