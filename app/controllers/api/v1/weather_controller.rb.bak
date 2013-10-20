class Api::V1::WeatherController < ApplicationController


  def index
    respond_to do |format|
       format.html {
        
	       client = YahooWeather::Client.new
         response = client.fetch('1132599')
 
		     @tempUnit = response.units.temperature        # "F"
 		     @temp =response.condition.temp           # 60
 		     @windDir=response.wind.direction('string') # "ESE"
	 	     @condition= response.condition.code('string') # "Partly cloudy (night)"
	 	     weather_info= {:location => "seoul", :temperature_unit => @tempUnit,:temperature =>@temp, :wind_direction=>@windDir,:weather_condition=>@condition}
		     require 'json'
	       @json_result =weather_info.to_json 
       } 
    
       format.json { 
          @longitude = params[:weather][:longitude]
          @latitude = params[:weather][:latitude]
          
 	         client = YahooWeather::Client.new
           response = client.fetch('1132599')  #seoul hard coded
 
           #          
 		       @unites_temperature_F = response.units.temperature        # "F"  
  		     @condition_temp_F  =response.condition.temp         
               
           #             @unites_temperature_C = response.units.temperature        # "C"  
           # @condition_temp_C  =response.condition.temp           
           
  		     @windDir=response.wind.direction('string') # "ESE"
 	 	       @condition= response.condition.code('string') # "Partly cloudy (night)"
 	 	       weather_info= {:location => "seoul", :temperature_unit => @tempUnit,:temperature =>@temp, :wind_direction=>@windDir,:weather_condition=>@condition}
 		       require 'json'
 	         @json_result =weather_info.to_json 
           
       }

    end
  end
  
  
  def create 
    respond_to do |format|
       format.html {
       }
       
       format.json {
          longitude = params[:weather][:longitude]
          latitude = params[:weather][:latitude]
          
 	         client = YahooWeather::Client.new
           response = client.fetch('1132599')  #seoul hard coded
 
           #          
 		       unites_temperature_F = response.units.temperature        # "F"  
  		     temp  =response.condition.temp         
               
           # unites_temperature_C = response.units.temperature        # "C"  
           # condition_temp_C  =response.condition.temp           
           
  		     windDir=response.wind.direction('string') # "ESE"
 	 	       condition= response.condition.code('string') # "Partly cloudy (night)"
 	 	 
           
         render :json => {:location => "seoul",:temperature => temp, :wind_direction => windDir,:condition_code => condition}
 		
         }
    end
  end

end
