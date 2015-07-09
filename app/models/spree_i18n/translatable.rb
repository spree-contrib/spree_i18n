module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern

    included do |klass|
      accepts_nested_attributes_for :translations

      translated_attribute_names.each do |t|
        ransacker t do |parent|
          Arel.sql("coalesce(#{translations_table_name}.#{t}, #{table_name}.#{t})")
        end
      end

      klass.class_eval do
        class << self
          alias_method_chain :ransack, :translations

          alias :search :ransack unless respond_to? :search
        end
      end
    end

    class_methods do
      def ransack_with_translations(params = {}, options = {})
        joins(:translations).ransack_without_translations(params, options)
      end
    end
  end
end
