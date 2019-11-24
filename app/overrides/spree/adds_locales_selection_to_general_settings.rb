if Spree.version.to_f < 4.0
  Deface::Override.new(
    virtual_path: 'spree/admin/general_settings/edit',
    name: 'locales_admin_selection',
    insert_after: '.row .currency',
    partial: 'spree/admin/general_settings/locales'
  )
else
  Deface::Override.new(
    virtual_path: 'spree/admin/general_settings/edit',
    name: 'locales_admin_selection',
    insert_after: '#general-settings-currency',
    partial: 'spree/admin/general_settings/locales'
  )
end
