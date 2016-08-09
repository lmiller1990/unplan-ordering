class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_order
    Order.find(session[:current_order_id])
  end
end
