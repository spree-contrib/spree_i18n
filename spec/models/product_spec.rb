# encoding: utf-8

module Spree
  RSpec.describe Product, type: :model do
    let(:product) { create(:product) }
    let(:taxon) { create(:taxon) }

    # Regression test for #309
    it "duplicates translations" do
      original_count = product.translations.count
      new_product = product.duplicate
      expect(new_product.translations).not_to be_blank
      expect(product.translations.count).to eq original_count
    end

    # Regression test for #433
    it "allow saving a product with taxons" do
      product.taxons << taxon
      expect(product.taxons).to include(taxon)
    end

    describe '.ransack' do
      let!(:product) { create(:product, name: 'find-me') }
      let!(:other_product) { create(:product, name: 'no-thanks') }

      it 'handles translation' do
        result = described_class.ransack(name_cont: product.name[0..2]).result
        expect(result.to_a).to eq [product]

        result = described_class.search(name_cont: product.name[0..2]).result
        expect(result.to_a).to eq [product]
      end

      it 'handles old-style translations' do
        Spree::Product.where(id: product.id).update_all(name: product.name)
        product.translations.update_all(name: nil)

        result = described_class.ransack(name_cont: product.name[0..2]).result
        expect(result.to_a).to eq [product]

        result = described_class.search(name_cont: product.name[0..2]).result
        expect(result.to_a).to eq [product]
      end

      it 'handles translation for an attribute disjunction' do
        result = described_class.ransack(name_or_description_cont: product.name[0..2]).result
        expect(result.to_a).to eq [product]

        result = described_class.ransack(description_or_name_cont: product.name[0..2]).result
        expect(result.to_a).to eq [product]
      end

      it 'handles ransack with a sorting parameter safely' do
        result = described_class.ransack(s: 'name asc').result
        expect(result.to_a).to match_array [product, other_product]
      end

      context 'ransacking by taxonomy' do
        let(:product_with_taxon) { create(:product, name: 'product-with-taxon') }
        let(:sack_params) { {m: 'or', name_cont: product.name, taxons_name_cont: product.name} }
        before do
          Spree::Product.whitelisted_ransackable_associations.push('taxons')
          product_with_taxon.taxons << create(:taxon, name: product.name)
        end
        it 'handles ransack with and/or grouping parameter safely' do
          result = described_class.ransack(sack_params).result
          expect(result.to_a).to match_array [product, product_with_taxon]
        end
      end

      it 'handles ransack with an invalid key safely' do
        result = described_class.ransack(foo: 'blub').result
        expect(result.to_a).to match_array [product, other_product]
      end
    end

    # Regression tests for #466
    describe ".like_any" do
      context "allow searching products through their translations" do
        before do
          I18n.locale = :"zh-CN"
        end

        it "with name" do
          product.translations.create locale: "zh-CN",
                                      name: "创意马克杯",
                                      description: "<p>一流工程师设计制造手工艺品</p>",
                                      meta_description: '顶尖工艺设计',
                                      meta_keywords: '工艺品'

          expect(Product.like_any([:name], ['创意'])).to include(product)
        end

        it "with name or description" do
          product.translations.create locale: "zh-CN",
                                      name: "创意马克杯",
                                      description: "<p>一流工程师设计制造手工艺品</p>",
                                      meta_description: '顶尖工艺设计',
                                      meta_keywords: '工艺品'

          expect(Product.like_any([:name, :description], ['手工艺品'])).to include(product)
        end
      end
    end

    context "soft-deletion" do
      subject do
        product.destroy
        product.reload
      end

      it "keeps the translation on deletion" do
        subject
        expect(product.translations).not_to be_empty
      end

      it "changes the slug on the translation to allow reuse of original slug" do
        expect do
          subject
        end.to change { product.slug }
      end
    end
  end
end
