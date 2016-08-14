class StaticPagesController < ApplicationController
  def home
    if Order.exists?(id: session[:current_order_id])
      # nothing
    else
      session.delete(:current_order_id)
    end

    @response = Weather.lookup(28414042, Weather::Units::CELSIUS)

    @forecasts = @response.forecasts.first(5)
      @today = @response.forecasts.first(1)
    @forecasts = @forecasts - @today
  end
end
