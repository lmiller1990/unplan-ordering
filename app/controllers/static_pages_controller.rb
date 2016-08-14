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
    puts @today.inspect
    @forecasts = @forecasts - @today



    # @weather = Openweather2.get_weather(city: 'tokyo', units: 'metric')
    # <Openweather2::Weather:0x007f9aca0062e0 @city="Tokyo",
    # @longitude=139.69, @latitude=35.69,
    # @temperature=30.7, @pressure=1004, @humidity=19,
    # @min_temperature=27.22, @max_temperature=35,
    # @clouds=92, @wind_speed=4.63, @wind_angle=148>

  end
end
