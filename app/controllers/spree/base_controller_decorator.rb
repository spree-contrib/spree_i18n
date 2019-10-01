module Spree::BaseControllerDecorator
  Spree::BaseController.include(SpreeI18n::LocaleHelper)
end
Spree::BaseController.prepend(Spree::BaseControllerDecorator)
