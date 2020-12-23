RSpec.describe Spree::HomeController, type: :controller do
  routes { Spree::Core::Engine.routes }

  before do
    reset_spree_preferences
    SpreeI18n::Config.available_locales = [:en, :es]
  end

  context 'tries not supported fr locale' do
    it 'falls back do default locale' do
      get :index, params: { locale: 'fr' }
      expect(I18n.locale).to eq :en
    end
  end

  context 'tries supported es locale' do
    it 'takes this locale' do
      get :index, params: { locale: 'es' }
      expect(I18n.locale).to eq :es
    end
  end
end

RSpec.describe Spree::LocaleController, type: :controller do
  routes { Spree::Core::Engine.routes }

  before do
    reset_spree_preferences
    SpreeI18n::Config.available_locales = [:en, :es]
  end

  describe "#set" do
    it 'redirects to referrer' do
      root = request.url
      request.env['HTTP_REFERER'] = "#{root}/products/some-product"
      post :set, params: { switch_to_locale: :es }
      expect(response).to redirect_to("#{root}/es/products/some-product")
    end
  end
end
