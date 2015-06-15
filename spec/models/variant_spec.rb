require 'spec_helper'


module Globalize
  module ActiveRecord
    module ClassMethods
      def with_translations(*locales)
        puts "  with translations => #{self.name}"
        locales = translated_locales if locales.empty?

        joins(:translations).readonly(false).with_locales(locales)
      end
    end
  end
end

module Spree
  RSpec.describe Variant do
    let(:product) do
      Product.create!(
        name: 'globalize',
        price: 19.99,
        shipping_category: ShippingCategory.create!(name: 'a')
      )
    end

    let!(:variant) do
      Variant.create!(
        price: 19.99,
        product: product
      )
    end

    before do
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    end

    # Spree::Variant Load (0.6ms)
    #
    # SELECT  "spree_variants".* FROM "spree_variants"
    #   INNER JOIN "spree_products" ON "spree_products"."id" = "spree_variants"."product_id"
    #               AND "spree_products"."deleted_at" IS NULL
    #   LEFT OUTER JOIN "spree_product_translations" ON "spree_product_translations"."spree_product_id" = "spree_products"."id"
    #   WHERE "spree_variants"."deleted_at" IS NULL
    #         AND "spree_products"."deleted_at" IS NULL
    #         AND "spree_product_translations"."name" = 'globalize'
    #         AND "spree_product_translations "."locale" = $1
    #   ORDER BY "spree_variants"."id" ASC LIMIT 1  [["locale", "en"]]
    #
    it 'fetches variant from product via translation table' do
      # globalize appends moar relations
      #
      # Product.preload(:translations)
      #        .joins(:translations)
      #        .readonly(false)
      #        .merge(GlobalizeTranslation.where(locale: :en))
      #        .where(name: 'globalize')

      product_relation = Product.where(name: "globalize")
      variant_relation = described_class.joins(:product).merge(product_relation)
      described_class.includes(:product).ransack(name_cont: 'globalize').result.to_a

      expect(variant_relation.last).to eq variant

      variants = described_class.includes(:product).ransack(name_cont: 'globalize').result.to_a
      expect(variants.last).to eq variant
    end
  end
end
