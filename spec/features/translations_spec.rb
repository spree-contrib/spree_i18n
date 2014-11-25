RSpec.feature "Translations" do
  context 'page' do
    context 'switches locale from the dropdown' do
      scenario 'selected translation is applied', js: true do
        visit '/'
        select('Português (BR)', :from => 'Language')

        expect(page).to have_content('INÍCIO')
      end
    end
  end

  context 'product' do
    let!(:product) do
      create(:product, name: 'Antimatter',
             translations: [
               Spree::Product::Translation.new(locale: 'pt-BR',
                                               name: 'Antimatéria')
             ])
    end

    before do
      I18n.locale = 'pt-BR'
      Spree::Frontend::Config[:locale] = 'pt-BR'
    end

    after do
      I18n.locale = :en
      Spree::Frontend::Config[:locale] = :en
    end

    scenario 'displays translated product page' do
      visit '/products/antimatter'
      expect(page.title).to have_content('Antimatéria')
    end

    scenario 'displays translated products list' do
      visit '/products'
      expect(page).to have_content('Antimatéria')
    end
  end
end
