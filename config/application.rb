require_relative "boot"

require "rails/all"
# require "propshaft" # <--- ¡ESTA LÍNEA DEBE IR COMENTADA O ELIMINADA!

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuoteEditor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Configuración para Propshaft y Sass
    # config.propshaft.css_paths << Rails.root.join("app/assets/stylesheets") # COMENTADA
    # config.propshaft.js_paths << Rails.root.join("app/assets/javascripts") # COMENTADA

    config.assets.css_compressor = :sassc
    config.sass.load_paths << Rails.root.join('app', 'assets', 'stylesheets')


    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end