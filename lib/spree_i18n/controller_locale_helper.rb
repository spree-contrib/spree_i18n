module SpreeI18n
  # The fact this logic is in a single module also helps to apply a custom
  # locale on the spree/api context since api base controller inherits from
  # MetalController instead of Spree::BaseController
  module ControllerLocaleHelper
    extend ActiveSupport::Concern

    included do
      prepend_before_action :set_user_language

      private

      # Overrides the Spree::Core::ControllerHelpers::Common logic so that only
      # supported locales defined by SpreeI18n::Config.supported_locales can
      # actually be set
      def set_user_language
        # params[:locale] can be added by routing-filter gem
        I18n.locale = \
          if params[:locale] && Config.available_locales.include?(params[:locale].to_sym)
            params[:locale]
          elsif respond_to?(:store_locale, true) && !store_locale.blank?
            store_locale
          elsif respond_to?(:current_store, true) && !current_store.blank? &&
            current_store.respond_to?(:default_locale, true) && !current_store.default_locale.blank?

            current_store.default_locale
          elsif respond_to?(:config_locale, true) && !config_locale.blank?
            config_locale
          else
            Rails.application.config.i18n.default_locale || I18n.default_locale
          end
      end
    end
  end
end
