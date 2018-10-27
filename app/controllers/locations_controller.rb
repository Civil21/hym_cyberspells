class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_location,except:[:index,:new,:create]

	def show
		#перевірка чи користувач на локаціїї 
		if(@player.locations !=[])
			@location = @player.locations
		else
			@player.locations.clear
			@player.locations << @location
			#@player.game_log.text = @location.description
			#@player.game_log.save
			@player.save
		end

		if(@player.quests != [])
			#обрати квест що проходить користувач
			@quest = Quest.find(@player.quests.ids)
		else
			#вибрати новий квест для користувача 
			@quests = @location.quests
  			if(@quests !=[])
				@quest = @quests[Random.new.rand(@quests.length)]
				@player.quests.clear
				@player.quests << @quest
				@player.save
			else
				redirect_to new_quest_path
			end
		end

		if(@player.variants != [])
			@variants = Variant.find(@player.variants.ids).first.variants
		else
			pp @quest
			pp @quest.variants
			pp @variants
			@variants = @quest.variants
		end
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

end
