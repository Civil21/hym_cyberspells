class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_player

  private 

  def get_player
  	if(user_signed_in?)
  		if(current_user.player)
  			@player=current_user.player
  			@game_log=@player.game_log
  		else
  			redirect_to new_player_path
  		end
  	end
  end
end
