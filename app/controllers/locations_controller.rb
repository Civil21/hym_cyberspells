class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_location,except:[:index,:new,:create]

	def show
		pp @player
		if(@player.location_id and @player.location_id==@location.id)
			if(@player.quest_id)
				@quest = Quest.find(@player.quest_id)
			else
				get_quest
			end
		else
			if(@player.location_id)
				redirect_to location_path(Location.find(@player.location_id).name)  
			else
				@player.location_id = @location.id
				get_quest
			end
		end
		pp @quest
	end

	def index
		pp @player
		pp @game_log
		if(@player.location_id)
			redirect_to location_path(Location.find(@player.location_id).name)  
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
  		@quests = @location.quests.to_a
  		if(@quests)
		@quest = @quests[Random.new.rand(@quests.length)]
		@player.quest_id = @quest.id
		@player.save
		else
			redirect_to new_quest_path
		end
  	end

end
