require 'spec_helper'

module Spree
  RSpec.describe Variant, type: :model do
    let!(:product) { create(:product, name: 'globalize') }
    let!(:variant) { product.master }
    let!(:other_product) { create(:product, name: 'other name') }
    let!(:other_variant) { other_product.master }

    it 'fetches variant name for variantAutocomplete' do
      variants = described_class.ransack(product_name_or_sku_cont: 'lob').result.to_a
      expect(variants).to match_array [variant]
    end
  end
end
