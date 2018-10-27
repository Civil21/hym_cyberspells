class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_item,except:[:index,:new,:create]

	def show

	end

	def index
		@items = Item.all
	end

	def new
		
	end

	def create
		@item=Item.create(item_params)
  		if @item.save
			redirect_to items_path  		
    	else
  			render 'new'
  		end
	end

	def edit
		
	end

	def update
  		@item.update(item_params)
  		redirect_to items_path
	end

	private 

  	def get_location
		@item = Item.find_by(name: params[:id])
		@item ||=Item.find(params[:id])
	end

  	def location_params
  		params.require(:item).permit(:name,:description)
  	end
end
