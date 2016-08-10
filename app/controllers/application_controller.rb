class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery with: :exception

  def set_locale
    if params[:locale].present?
      flash[:warning] = "Changing locale from: ", I18n.locale
      I18n.locale = params[:locale]
      flash[:warning] = "Changing locale to: ", I18n.locale

    end
  end

  def current_order
    Order.find(session[:current_order_id])
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
end
