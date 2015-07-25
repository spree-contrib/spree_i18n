module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern

    included do |klass|
      accepts_nested_attributes_for :translations
    end

    class_methods do
      def ransack(params = {}, options = {})
        params.keys.each do |key|
          stripped_name = key.to_s.dup
          pred = Ransack::Predicate.detect_and_strip_from_string!(stripped_name)

          names = stripped_name.split /_or_/
          translated_names = names.map do |name|
            if translated_attribute_names.include? name.to_sym
              "#{name}_or_translations_#{name}"
            else
              name
            end
          end
          translated_key = translated_names.join('_or_')
          translated_key += "_#{pred}" unless pred == ''

          if translated_key != key
            params[translated_key] = params[key]
            params.delete key
          end
        end

        super(params, options)
      end

      alias :search :ransack unless respond_to? :search
    end
  end
end
