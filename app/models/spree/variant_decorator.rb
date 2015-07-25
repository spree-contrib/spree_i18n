require 'spree_i18n/ransack_translator'

module Spree
  Variant.class_eval do
    def self.ransack(params = {}, options = {})
      translated_params = SpreeI18n::RansackTranslator.new(self, params).translated_params

      super(translated_params, options)
    end
  end
end
