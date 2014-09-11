module Spree
	Admin::PaymentMethodsController.class_eval do
		alias_method :old_update, :update

		# Re-define #update to work better with PATCH
		def update
			return old_update unless params["payment_method"][:translations_attributes]

			invoke_callbacks(:update, :before)

			@payment_method = PaymentMethod.find(params[:id])

			# This next part is basically a copy of what was in the original #update without the type force checking.
			update_params = params[ActiveModel::Naming.param_key(@payment_method)] || {}
			attributes = payment_method_params.merge(update_params)
			attributes.each do |k,v|
				if k.include?("password") && attributes[k].blank?
					attributes.delete(k)
				end
			end

			if @payment_method.update_attributes(attributes)
				invoke_callbacks(:update, :after)
				flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:payment_method))
				redirect_to edit_admin_payment_method_path(@payment_method)
			else
				invoke_callbacks(:update, :fails)
				respond_with(@payment_method)
			end

		end
	end

end