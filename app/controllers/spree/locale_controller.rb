module Spree
  class LocaleController < Spree::BaseController
    def index
      render :index, layout: false
    end

    def set
      if request.referrer
        path = spree.routes.recognize_path(request.referrer)
        path[:locale] = params[:switch_to_locale]
        redirect_to url_for(path)
      else
        redirect_to root_path(locale: params[:switch_to_locale])
      end
    end
  end
end
