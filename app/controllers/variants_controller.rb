class VariantsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_variant,except:[:index,:new,:create,:check]

	def show

	end

	def index
		@variants = Variant.all
	end

	def new
		
	end

	def create
		@variant=Variant.create(variant_params)
		if(params[:variant][:quest_ids]||params[:next][:variant_id])
			if(params[:variant][:quest_ids])
				Quest.find(params[:variant][:quest_ids]).variants <<@variant
			else
				var1=Variant.find(params[:next][:variant_id]).id.to_i 
				var2=@variant.id.to_i
				VariantNext.create(variant_id: var1, next: var2)
			end
  			if @variant.save
				redirect_to root_path
			end  		
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
		@variant =Variant.find(params[:variant_id])
		if((@player.quest != [] and @player.quest.first.variants.include? @variant) or (@player.variant != [] and VariantNext.new.findVariants(@player).include? @variant))
			pp 1
			@player.variant.clear
			@game_log.p(@variant.description)
			@game_log.b('Ви обрали: "'+@variant.text+'"')
			

			if(@variant.exp_id ) 
				pp 1.1
				if(!(@player.exps.ids.include? @variant.exp_id))
					@game_log.p("Ви отримали титул "+Exp.find(@variant.exp_id).name)
					@player.exps << Exp.find(@variant.exp_id)
				else
					@game_log.p("Ви уже отримали титул "+Exp.find(@variant.exp_id).name)
				end
			end
			#якщо добавити можливість стакуння предмета потрібно буде зробити через проміжну таблицю з додатковими значеннями типу у користувача є стільки предметів
			if(@variant.item_id && !(@player.items.ids.include? @variant.item_id)) 
				pp 1.2
				@game_log.p( "Ви отримали "+Item.find(@variant.item_id).name)
				@player.items << Item.find(@variant.item_id) 
			end

			if(@variant.isDeath)
				pp 1.3
				@player.items.clear
				@game_log.text = nil
				@game_log.h3( "Ви померли під час квесту, спробуйте знову , може вам повезе іншого разу!")
				@game_log.locations.clear
			end
			if(@variant.isFinish)
				pp 1.4
				@player.xp = @player.xp.to_i+10
				@player.save
			end
			if(@variant.isFinish || @variant.isDeath)
				pp 1.5
				@player.location.clear
				@player.quest.clear
				redirect_to locations_path
			else
				@player.variant << @variant
			end
			@game_log.save
		else
			pp "Проблема . квест ймовірно є неможливим так як не містить завершення"
		end
		if(@player.location != [])
			redirect_to location_path(@player.location.first.name)
		end
	end

	private 

  	def get_variant
  		@variant =Variant.find(params[:id])
	end

  	def variant_params
  		params.require(:variant).permit(:text,:description,:isFinish,:isDeath,:item_id,:exp_id)
  	end

end
