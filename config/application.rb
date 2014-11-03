require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Apollo
  class Application < Rails::Application

    config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
    config.assets.paths << "#{Rails.root}/app/assets/img"
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w( .svg .eot .woff .ttf )

    config.assets.initialize_on_precompile = false

    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper      = false

    config.time_zone = "Eastern Time (US & Canada)"
    config.active_record.default_timezone = :local

  end
end
