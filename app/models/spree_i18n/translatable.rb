module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern
    included do
      accepts_nested_attributes_for :translations
    end

    class_methods do
      def ransack(params = {}, options = {})
        names = params.keys

        names.each do |n|
          translated_attribute_names.each do |t|
            if n.to_s.starts_with? t.to_s
              params[:"translations_#{n}"] = params[n]
              params.delete n
            end
          end
        end

        super(params, options)
      end
    end
  end
end
