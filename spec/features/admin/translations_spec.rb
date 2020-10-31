# coding: utf-8
RSpec.feature 'Translations', :js do
  stub_authorization!

  given!(:store) { create(:store) }

  background do
    reset_spree_preferences
  end

  context 'localization settings' do
    given(:language) { Spree.t(:this_file_language, scope: 'i18n', locale: 'de') }
    given(:french) { Spree.t(:this_file_language, scope: 'i18n', locale: 'fr') }

    background do
      SpreeI18n::Config.available_locales = []
      visit spree.edit_admin_general_settings_path
    end

    scenario 'adds german to available locales' do
      find('#s2id_available_locales_').click
      find('.select2-result-selectable', text: language).click
      click_on 'Update'
      expect(SpreeI18n::Config.available_locales).to include(:de)
    end

    scenario 'adds french to available locales' do
      find('#s2id_available_locales_').click
      find('.select2-result-selectable', text: french).click
      click_on 'Update'
      expect(SpreeI18n::Config.available_locales).to include(:fr)
    end
  end
end
