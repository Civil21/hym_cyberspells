class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_location,except:[:index,:new,:create]

	def show
		if(@player.locations !=[] and Location.find(@player.locations.ids).first.id==@location.id)
			pp @player.quests
			if(@player.quests != [])
				@quest = Quest.find(@player.quests.ids)
			else
				get_quest
			end
		else
			if(@player.locations != [])
				redirect_to location_path(Location.find(@player.locations.ids).first.name)
			else
				@player.locations << @location
				get_quest
			end
		end
		pp @quest
	end

	def index
		if(@player.locations != [])
			redirect_to location_path(Location.find(@player.locations.ids).first.name)  
		else
			if(@game_log)
				@locations=@game_log.locations
				else
				@locations = Location.all
			end
		end
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

  	def get_quest
  		@quests = @location.quests
  		if(@quests !=[])
		@quest = @quests[Random.new.rand(@quests.length)]
		@player.quests << @quest
		@player.save
		else
			redirect_to new_quest_path
		end
  	end

end
