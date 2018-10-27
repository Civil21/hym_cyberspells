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

		#var1 = Vasdasd.to_i
		#var2 = asdasd.to_i

		#Variant_map.create(var1, var2)


		@variant=Variant.create(variant_params)
		if(params[:variant][:quest_sel]=='1')
			Quest.find(params[:variant][:quest_id]).variants <<@variant
		else
			pp @variant
			#Variant.find(params[:variant][:variant_id]).maps << @variant.id
			var1=Variant.find(params[:variant][:variant_id]).id.to_i 
			var2=@variant.id.to_i
			VariantNext.create(variant_id: var1, next: var2)
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
		if((@player.quest != [] and @player.quest.first.variants.include? @variant) or (@player.variant != [] and VariantNext.new.findVariants(@player).include? @variant))
			@player.variant.clear
			if(@variant.isFinish)
				@player.xp = @player.xp.to_i+10
				@player.save
				@player.location.clear
				@player.quest.clear
				if(@variant.exp_id) 
					@player.exps << Exp.find(@variant.exp_id)
				end
				if(@variant.isDeath)
					@player.items.clear
					@game_log.text = nil
					@game_log.locations.clear
				else
					if(@variant.item_id) 
						@player.items << Item.find(@variant.item_id) 
					end
				end
				redirect_to locations_path
			else
				@player.variant << @variant
			end
		end
		if(@player.location != [])
			redirect_to location_path(@player.location.first.name)
		end
	end

	private 

  	def get_variant

		@variant =Variant.find(params[:variant_id])
	end

  	def variant_params
  		params.require(:variant).permit(:text,:description,:isFinish,:isDeath,:item_id,:exp_id)
  	end

end
