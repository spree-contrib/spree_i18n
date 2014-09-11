class AddTranslationsToPaymentMethod < ActiveRecord::Migration
	def up
		params = { :name => :string, :description => :string }
		Spree::PaymentMethod.create_translation_table!(params, { :migrate_data => true })
	end
	def down
		Spree::PaymentMethod.drop_translation_table! :migrate_data => true
	end
end
