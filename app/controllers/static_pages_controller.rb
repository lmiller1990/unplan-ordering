class StaticPagesController < ApplicationController
  def home
    if Order.exists?(id: session[:current_order_id])
      # nothing
    else
      session.delete(:current_order_id)
    end
  end
end
