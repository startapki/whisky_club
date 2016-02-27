require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WhiskyClub
  class Application < Rails::Application
    config.i18n.default_locale = :ru

    config.to_prepare do
      [
        Devise::SessionsController,
        Devise::RegistrationsController,
        Devise::ConfirmationsController,
        Devise::UnlocksController,
        Devise::PasswordsController
      ].each { |controller| controller.layout 'devise' }

      Devise::Mailer.layout 'mailer'
    end
  end
end
