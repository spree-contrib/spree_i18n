Spree::Admin::OptionValuesController.class_eval do
  def update
    option_value = Spree::OptionValue.find(params[:id])
    option_value.update_attributes(params[:option_value])
    redirect_to spree.edit_admin_option_type_path(option_value.option_type)
  end
end