require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require 'pdfkit'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Theme to Rails Admin
ENV['RAILS_ADMIN_THEME'] = 'flatly_theme'
#ENV['RAILS_ADMIN_THEME'] = 'glyph'

module NovaCurriculos
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-BR'

    # Generate JavaScript
    config.generators.javascripts = false

    #config.assets.precompile += ["rails_admin/rails_admin.js", "rails_admin/rails_admin.css", "rails_admin/jquery.colorpicker.js", "rails_admin/jquery.colorpicker.css", 'ckeditor/*']

    # Custom Fail Devise
    config.autoload_paths += %W(#{config.root}/lib)

    # PDFKIT
    config.middleware.use PDFKit::Middleware, :print_media_type => true
  end
end
