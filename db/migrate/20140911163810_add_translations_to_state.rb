class AddTranslationsToState < ActiveRecord::Migration
	def up
		params = { :name => :string }
		Spree::State.create_translation_table!(params, { :migrate_data => true })
	end
	def down
		Spree::State.drop_translation_table! :migrate_data => true
	end
end
