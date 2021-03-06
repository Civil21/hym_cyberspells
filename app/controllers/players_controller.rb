class PlayersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_player, except:[:index]

	def index
		
	end

	def show
		@items = Item.find(@player.items.ids)
		@exps = Exp.find(@player.exps.ids)
	end

	def new
		
	end

	def create
		@player=Player.create(player_params)
		params[:player][:user_id]=current_user.id
		@user=User.find(current_user.id)
  		@user.player = @player

  		if @player.save and @user.save  	
  			@game_log = GameLog.create(text: "" ,player_id: @player.id)
  			@player.game_log = @game_log

			redirect_to player_path(@player.id)  		
    	else
  			render 'new'
  		end
	end

	def edit
		
	end

	def update
		
	end

	def rates
		@players =Player.all.order("xp DESC")
	end

	private 

	def get_player
		@player = Player.find_by(id: params[:id])
	end

	def player_params
		params.require(:player).permit(:name,:user_id,:location_id,:quest_id,:variant_id,:xp)
	end
end
