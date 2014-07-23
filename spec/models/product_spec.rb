require 'spec_helper'

module Spree
  describe Product do
    let(:product) { FactoryGirl.create(:product) }
    let(:taxon) { FactoryGirl.create(:taxon) }

    # Regression test for #309
    it "duplicates translations" do
      original_count = product.translations.count
      new_product = product.duplicate
      new_product.translations.should_not be_blank
      product.translations.count.should == original_count
    end

    # Regression test for #433
    it "allow saving a product with taxons" do
      product.taxons << taxon
      product.taxons.should include(taxon)
    end
  end
end