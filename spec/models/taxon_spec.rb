# encoding: utf-8

module Spree
  RSpec.describe Taxon, type: :model do
    describe '.ransack' do
      let!(:taxon) { create(:taxon, name: 'find-me') }
      let!(:other_taxon) { create(:taxon, name: 'no-thanks') }

      it 'handles translation' do
        result = described_class.ransack(name_cont: taxon.name[0..2]).result
        expect(result.to_a).to eq [taxon]

        result = described_class.search(name_cont: taxon.name[0..2]).result
        expect(result.to_a).to eq [taxon]
      end
    end
  end
end
