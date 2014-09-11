Spree::Admin::ShippingMethodsController.class_eval do
	private
	alias_method :old_set_shipping_category, :set_shipping_category
	alias_method :old_set_zones, :set_zones

	# We have to override those filters since they break proper PATCH behaviour.

	def set_shipping_category
		old_set_shipping_category unless params["shipping_method"][:translations_attributes]
	end

	def set_zones
		old_set_zones unless params["shipping_method"][:translations_attributes]
	end
end
