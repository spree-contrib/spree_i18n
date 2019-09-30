module Spree::Api::BaseControllerDecorator
  def self.prepended(base)
    base.include SpreeI18n::ControllerLocaleHelper
  end
end
Spree::Api::BaseController.prepend(Spree::Api::BaseControllerDecorator)
