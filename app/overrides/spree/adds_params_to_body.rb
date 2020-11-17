Deface::Override.new(
  virtual_path: 'spree/layouts/spree_application',
  name: 'adds_js_params',
  insert_top: 'body',
  partial: 'spree/layouts/add_js_params'
)
