class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_location,except:[:index,:new,:create]

	def show
		#перевірка чи користувач на локаціїї 
		if(@player.location !=[])
			@location = @player.location.first
		else
			@player.location.clear
			@player.location << @location
			#@player.game_log.text = @location.description
			#@player.game_log.save
		end

		if(@player.quest != [])
			#обрати квест що проходить користувач
			@quest = Quest.find(@player.quest.ids).first
		else
			#вибрати новий квест для користувача 
			pp @location.quests
  			if(@location.quests != [])
  				@quests = @location.quests
				@quest = @quests[Random.new.rand(@quests.length)]
				@player.quest.clear
				@player.quest << @quest
				if(@player.variant != [])
					@variants = Variant.find(@player.variant.ids).first.variants
				else
					@variants = @quest.variants
				end
			else
				redirect_to new_quest_path
			end
		end


	end

	def index
		if(@player.location != [])
			redirect_to location_path(Location.find(@player.location.ids).first.name)  
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
		@location ||= Location.find(params[:id])
	end

  	def location_params
  		params.require(:location).permit(:name,:description)
  	end

end
