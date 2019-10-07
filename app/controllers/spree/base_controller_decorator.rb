module Spree::BaseControllerDecorator
  Spree::BaseController.include(SpreeI18n::ControllerLocaleHelper)
end
Spree::BaseController.prepend(Spree::BaseControllerDecorator)
