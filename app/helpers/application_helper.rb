module ApplicationHelper
  def current_order
    Order.find(session[:current_order_id])
  end
end
