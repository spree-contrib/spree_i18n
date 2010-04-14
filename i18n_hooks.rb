class I18nHooks < Spree::ThemeSupport::HookListener
  if Spree::Config[:allow_locale_switching] 
    replace :footer_right, :partial => 'shared/language_bar'
  end
end
