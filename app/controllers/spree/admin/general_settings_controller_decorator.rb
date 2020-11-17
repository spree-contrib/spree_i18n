module Spree::Admin::GeneralSettingsControllerDecorator
  def self.prepended(base)
    base.before_action :update_i18n_settings, only: :update
  end

  private

  def update_i18n_settings
    params.each do |name, value|
      next unless SpreeI18n::Config.has_preference? name
      SpreeI18n::Config[name] = value.map(&:to_sym)
    end
  end
end
Spree::Admin::GeneralSettingsController.prepend(Spree::Admin::GeneralSettingsControllerDecorator)
