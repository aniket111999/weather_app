class WeatherController < ApplicationController
  before_action :require_user

  require 'net/http'
  require 'uri'
  #make api call to OpenWeathermap api to get json data
  def show
    api_key = 'b0dcda1ff0e8c309df7dce613d3d6992' #api_key can be stored in ENV variables or in database for security purose
    city = params[:city_name]

    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    @weather_data = JSON.parse(response)
    puts @weather_data
    if @weather_data["cod"] == 200
      render 'weather/weather_data'
    else
      flash[:error] = 'Could not find entered city in our database.'
      render 'weather/weather'
    end
  end

  def home
    render 'weather/weather'
  end
end