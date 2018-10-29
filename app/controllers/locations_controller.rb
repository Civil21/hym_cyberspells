class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_location,except:[:index,:new,:create]
	before_action :get_game_log, only: [:show,:index]

	def show
		@game_log.locations.except(@location)
		#перевірка чи користувач на локаціїї 
		if(@player.location !=[])
			@location = @player.location.first
		else
			@game_log.b("Ви відправились в "+@location.name.to_s)
			@game_log.p (@location.description)
			@game_log.save
			@player.location.clear
			@player.location << @location
			#@player.game_log.text = @location.description
			#@player.game_log.save
		end

		if(@player.quest != [])
			#обрати квест що проходить користувач
			@quest = Quest.find(@player.quest.ids).first
				if(@player.variant != [])
					@variants = VariantNext.new.findVariants(@player)
				else
					@variants = @quest.variants
				end
		else
			#вибрати новий квест для користувача 
  			if(@location.quests != [])
  				@quests = @location.quests
				@quest = @quests[Random.new.rand(@quests.length)]
				@player.quest.clear
				@player.quest << @quest
				if(@player.variant != [])
					@variants = VariantNext.new.findVariants(@player)
				else
					@variants = @quest.variants
				end
				@game_log.b("Ви розпочали  "+@quest.name)
				@game_log.p(@quest.description)
				@game_log.save
			else
				redirect_to new_quest_path
			end
		end
	end

	def index
		if(@player.location != [])
			redirect_to location_path(Location.find(@player.location.ids).first.name)  
		else
			if(@game_log&& @game_log.locations !=[])
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
			redirect_to locations_path	
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

	def get_game_log
		@game_log= @player.game_log
		if(!@game_log)
			@game_log=GameLog.create()
			@player.game_log = @game_log
		 end
	end

  	def location_params
  		params.require(:location).permit(:name,:description)
  	end

end
