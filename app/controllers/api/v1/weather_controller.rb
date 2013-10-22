class Api::V1::WeatherController < ApplicationController
  
  def create 
    respond_to do |format|
       format.html {
       }
       
       format.json {
         longitude = params[:weather][:longitude]
         latitude = params[:weather][:latitude]
          
 	       client = YahooWeather::Client.new
         response = client.fetch('1132599')  #seoul hard coded
           
           
 
                    
          # units_temperature = response.units.temperature        # "F"  
  		   temp_F = response.condition.temp  
         # temp_C = response.units.temperature('c')  
         temp_C =  (temp_F - 32) * 5 /9
            
           
  		   windDir = response.wind.direction('string') 
         
         condition_code = response.condition.code 
 	 	     condition = response.condition.code('string') 
 	 	 
         sunrise = response.astronomy.sunrise
         sunset = response.astronomy.sunset
         render :json => {:location => "Seoul", 
                          :temperature_F => temp_F,  :temperature_C => temp_C, 
                          :wind_direction => windDir, 
                          :condition_code => condition_code, :condition=> condition,                         
                          :sunrise => sunrise, :sunset => sunset}
 		
         }
    end
  end

end
