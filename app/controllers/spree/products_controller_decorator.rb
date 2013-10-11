Spree::ProductsController.class_eval do
  private
   def load_product
     if try_spree_current_user.try(:has_spree_role?, "admin")
       product_translation = Spree::Product::Translation.find_by(:permalink => params[:id],:locale => [I18n.locale,I18n.default_locale])
       @product = Spree::Product.find(product_translation.spree_product_id) if product_translation
     else
       product_translation = Spree::Product::Translation.find_by(:permalink => params[:id],:locale => [I18n.locale,I18n.default_locale])
       @product = Spree::Product.active(current_currency).find(product_translation.spree_product_id) if product_translation
     end
   end
end