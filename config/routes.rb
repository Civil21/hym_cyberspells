Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
	root to:"pages#index"
	get "about", to: "pages#about"
	get "info", to: "pages#info"
	resources :players do 

	end

	resources :locations do

	end

	resources :quests ,except:[:index] do

	end 

end
