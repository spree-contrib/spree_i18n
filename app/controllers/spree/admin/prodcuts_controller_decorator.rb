Spree::Admin::ProductsController.class_eval do

  protected
  def find_resource
    if parent_data.present?
      parent.send(controller_name).find(params[:id])
    else
       Spree::Product.find Spree::Product::Translation.find_by(:permalink => params[:id]).spree_product_id
    end
  end

end