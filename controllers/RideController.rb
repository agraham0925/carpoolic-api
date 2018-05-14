class RideController < ApplicationController

	# filter to allow JSON requests to be processed
  	before do

    	payload_body = request.body.read

    	if(payload_body != "")
    	  @payload = JSON.parse(payload_body).symbolize_keys

    	  puts "-----------------------------------------------HERE IS OUR PAYLOAD"
    	  pp @payload
    	  puts "-----------------------------------------------------------------"
    	end
  	end

	get '/' do 
		@rides = Ride.all
		@rides.to_json

		{
			success: true,
			message: "successfully retrieved #{@rides.length} rides",
			retrieved_rides: @rides
		}.to_json	
	end
end