require 'spree_i18n/ransack_translator'

module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern

    included do |klass|
      accepts_nested_attributes_for :translations
    end

    class_methods do
      def ransack(params = {}, options = {})
        translated_params = RansackTranslator.new(self, params).translated_params

        super(translated_params, options)
      end

      alias :search :ransack unless respond_to? :search
    end
  end
end
