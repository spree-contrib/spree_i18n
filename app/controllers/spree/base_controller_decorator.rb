module Spree::BaseControllerDecorator
  def self.prepended(base)
    base.include SpreeI18n::ControllerLocaleHelper
  end
end
Spree::BaseController.prepend(Spree::BaseControllerDecorator)
