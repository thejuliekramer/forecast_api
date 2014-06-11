class ForecastController < ApplicationController

		require 'forecast_io'
		require 'typhoeus/adapters/faraday'
		require 'geocoder'

	def index

  	city = request.location
  	userSearch = params[:q]

	  	if userSearch
	 		# the geocoder is searching for city
	    	geocoder = Geocoder.search userSearch
	    else
	    	geocoder = Geocoder.search city	
	   	end

	   	if geocoder

   		lat = location[0].geometry["location"]["lat"]
  		
  		lng = location[0].geometry["location"]["lng"]

  		ForecastIO.api_key = '545bc8ee1ee9907df971316c7968014a'

			@forecast = ForecastIO.forecast(lat, lng)

  		end    
  end
  
end