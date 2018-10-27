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

	def check
		if((@player.quest != [] and @player.quest.first.variants.include? @variant) or (@player.variant != [] and @player.variant.variants.include? @variant))
			@player.variant.clear
			@player.variant << @variant
		end
		redirect_to location_path(@player.location.first.name)
	end

	private 

  	def get_variant

		@variant =Variant.find(params[:variant_id])
	end

  	def variant_params
  		params.require(:variant).permit(:text,:description)
  	end

end
