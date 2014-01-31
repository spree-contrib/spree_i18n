Spree::Core::Engine.routes.prepend do
  match '/locale/set', :to => 'locale#set', :defaults => { :format => :json }, :as => :set_locale

  namespace :admin do
    get '/:resource/:resource_id/translations' => 'translations#index', as: :translations
    put '/option_values/:id' => 'option_values#update', as: :option_type_option_value
  end
end
