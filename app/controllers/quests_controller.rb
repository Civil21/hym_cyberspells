class QuestsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_quest,except:[:new,:create]

	def show
		
	end

	def new

	end

	def create
		@quest=Quest.create(quest_params)
  		if @quest.save
			redirect_to quest_path(@quest.name)  		
    	else
  			render 'new'
  		end
	end

	def edit
		
	end

	def update
  		@quest.update(quest_params)
  		redirect_to quest_path(@quest.name)
	end

	private 

	def get_quest
		@quest = Quest.find_by(name: params[:id])
		if(!@quest)
			@quest=Quest.find_by(id: params[:id])
		end
	end

	def quest_params
		params.require(:quest).permit(:name,:description,:location_id)
	end
end
