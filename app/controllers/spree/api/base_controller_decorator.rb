module Spree::Api::BaseControllerDecorator
  Spree::Api::BaseController.include(SpreeI18n::LocaleHelper)
end
Spree::Api::BaseController.prepend(Spree::Api::BaseControllerDecorator)
