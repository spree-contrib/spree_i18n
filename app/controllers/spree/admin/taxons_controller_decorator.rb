Spree::Admin::TaxonsController.class_eval do  
  private
    def permitted_params
      [:name, :parent_id, :position, :icon, :description, :permalink,
       :taxonomy_id, :meta_description, :meta_keywords, :meta_title,:translations_attributes => [:id,:locale, :name, :description,:meta_title, :meta_description, :meta_keywords, :permalink]]
    end
end