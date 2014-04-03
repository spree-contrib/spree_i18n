module SpreeI18n
  # The fact this logic is in a single module also helps to apply a custom
  # locale on the spree/api context since api base controller inherits from
  # MetalController instead of Spree::BaseController
  module ControllerLocaleHelper
    extend ActiveSupport::Concern
    included do
      before_filter :set_user_language
      before_filter :globalize_fallbacks
      helper_method :checkout_state_path

      def checkout_state_path(state)
        state = Spree.t("checkout_steps.slugs.#{state}", default: state)
        spree.checkout_state_path state
      end

      private
        # Overrides the Spree::Core::ControllerHelpers::Common logic so that only
        # supported locales defined by SpreeI18n::Config.supported_locales can
        # actually be set
        def set_user_language
          I18n.locale = if session.key?(:locale) && Config.supported_locales.include?(session[:locale].to_sym)
            session[:locale]
          elsif respond_to?(:config_locale, true) && !config_locale.blank?
            config_locale
          else
            Rails.application.config.i18n.default_locale || I18n.default_locale
          end
        end

        def globalize_fallbacks
          Fallbacks.config!
        end
    end
  end
end
