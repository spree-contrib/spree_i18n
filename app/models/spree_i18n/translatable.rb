module SpreeI18n
  module Translatable
    extend ActiveSupport::Concern
    include Spree::RansackableAttributes
    
    included do |klass|
      accepts_nested_attributes_for :translations
      klass.whitelisted_ransackable_associations |= ['translations']
    end
  end
end
