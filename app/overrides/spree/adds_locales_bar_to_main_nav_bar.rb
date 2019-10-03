Deface::Override.new(
  virtual_path: 'spree/shared/main_nav_bar',
  name: 'main_nav_bar_locales_bar',
  insert_bottom: '#main-nav-bar > .navbar-right',
  partial: 'spree/shared/locales_bar'
)
