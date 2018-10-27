class VariantsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_variant,except:[:index,:new,:create]

	def show

	end

	def index
		@variants = Variant.all
	end

	def new
		
	end

	def create
		@variant=Variant.create(variant_params)
		if(params[:variant][:quest_sel]=='1')
			Quest.find(params[:variant][:quest_id]).variants <<@variant
		else
			Variant.find(params[:variant][:variant_id]).variants <<@variant
		end
  		if @variant.save
			redirect_to root_path  		
    	else
  			render 'new'
  		end
	end

	def edit
		
	end

	def update
  		@variant.update(variant_params)
  		redirect_to variants_path
	end

	private 

  	def get_location
		@variant = Variant.find_by(name: params[:id])
		@variant ||=Variant.find(params[:id])
	end

  	def variant_params
  		params.require(:variant).permit(:text,:description)
  	end

end
