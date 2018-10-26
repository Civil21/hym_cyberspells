class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_player

  private 

  def get_player
  	if(user_signed_in?)
  		if(current_user.player)
  			@player
  		else
  			redirect_to new_player_path
  		end
  	end
  end
end
