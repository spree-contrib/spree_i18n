module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern

    included do |klass|
      accepts_nested_attributes_for :translations
      klass.class_eval do
        class << self
          alias_method_chain :ransack, :translations

          alias :search :ransack unless respond_to? :search
        end
      end
    end

    class_methods do
      def ransack_with_translations(params = {}, options = {})
        params.keys.each do |n|
          stripped_name = n.to_s.dup
          Ransack::Predicate.detect_and_strip_from_string!(stripped_name)
          translated_attribute_names.each do |t|
            if stripped_name.to_s.starts_with? t.to_s
              params[:"#{stripped_name}_or_translations_#{n}"] = params[n]
              params.delete n
            end
          end
        end

        ransack_without_translations(params, options)
      end
    end
  end
end
