class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery with: :exception

  def set_locale
      I18n.locale = params[:locale]
  end

  def current_order
    Order.find(session[:current_order_id])
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
end
