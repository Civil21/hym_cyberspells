class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_location,except:[:index,:new,:create]

	def show
		@quests = @location.quests
	end

	def index
		@loactions = @player.locations
	end

	def new
		
	end

	def create
		@location=Location.create(location_params)
  		if @location.save
			redirect_to location_path(@location.name)  		
    	else
  			render 'new'
  		end
	end

	def edit
		
	end

	def update
  		@location.update(location_params)
  		redirect_to location_path(@location.name)
	end

	private 

  	def get_location
		@location = Location.find_by(name: params[:id])
		@location ||=Location.find(params[:id])
	end

  	def location_params
  		params.require(:location).permit(:name,:description)
  	end

end
