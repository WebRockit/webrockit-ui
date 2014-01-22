require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

Bundler.require(:default, Rails.env)

module WebrockitUi
  class Application < Rails::Application
    config.assets.enabled = false

    #TODO: pull this out into the config.yml
    config.time_zone = 'Arizona'

  end
end
