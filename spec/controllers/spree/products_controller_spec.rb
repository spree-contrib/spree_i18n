RSpec.describe Spree::ProductsController, type: :controller do
  let!(:product) { create(:product) }

  before do
    allow(controller).to receive(:config_locale).and_return(:'pt-BR')
  end

  context 'visit non translated product page via permalink on url' do
    it 'displays pages successfully' do
      spree_get :show, id: product.slug
      expect(response).to be_success
    end
  end
end
