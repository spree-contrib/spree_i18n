module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern

    included do |klass|
      accepts_nested_attributes_for :translations
      klass.whitelisted_ransackable_associations ||= []
      klass.whitelisted_ransackable_associations |= ['translations']
    end
  end
end
