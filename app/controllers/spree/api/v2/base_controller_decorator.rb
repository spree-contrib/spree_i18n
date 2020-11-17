module Spree::Api::V2::BaseControllerDecorator
  Spree::Api::V2::BaseController.include(SpreeI18n::ControllerLocaleHelper)
end
Spree::Api::V2::BaseController.prepend(Spree::Api::V2::BaseControllerDecorator)
