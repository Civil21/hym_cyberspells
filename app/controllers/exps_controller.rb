class ExpsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_exp,except:[:index,:new,:create]

	def show

	end

	def index
		@exps=Exp.all
	end

	def new
		
	end

	def create
		@exp=Exp.create(exp_params)
  		if @exp.save
			redirect_to exps_path		
    	else
  			render 'new'
  		end
	end

	def edit
		
	end

	def update
  		@exp.update(exp_params)
  		redirect_to exps_path
	end

	private 

  	def get_exp
		@exp = Exp.find_by(name: params[:id])
		@exp ||=Exp.find(params[:id])
	end

  	def exp_params
  		params.require(:exp).permit(:name,:description)
  	end
end
