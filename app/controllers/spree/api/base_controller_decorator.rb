module Spree::Api::BaseControllerDecorator
  Spree::Api::BaseController.include(SpreeI18n::ControllerLocaleHelper)
end
Spree::Api::BaseController.prepend(Spree::Api::BaseControllerDecorator)
