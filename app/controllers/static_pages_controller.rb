class StaticPagesController < ApplicationController
  def home
    if Order.exists?(id: session[:current_order_id])
      # nothing
    else
      session.delete(:current_order_id)
    end

    @api_response = Weather.lookup(28414042, Weather::Units::CELSIUS)

    @forecasts = @api_response.forecasts.first(5)
    @today = @api_response.forecasts.first(1)
    @forecasts = @forecasts - @today
  end
end
