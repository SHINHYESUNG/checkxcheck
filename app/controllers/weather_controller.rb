class WeatherController < ApplicationController


  def load
		client = YahooWeather::Client.new
    response = client.fetch('1132599')
 
		@tempUnit = response.units.temperature        # "F"
 		@temp =response.condition.temp           # 60
 		@windDir=response.wind.direction('string') # "ESE"
	 	@condition= response.condition.code('string') # "Partly cloudy (night)"
	 	weather_info= {:temperature_unit => @tempUnit,:temperature =>@temp, :wind_direction=>@windDir,:weather_condition=>@condition}
		require 'json'
	  @json_result =weather_info.to_json 


 end







end
