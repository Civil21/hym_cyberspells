Rails.application.routes.draw do

  	devise_for :admin_users, ActiveAdmin::Devise.config
  	ActiveAdmin.routes(self)

  	devise_for :users

	root to:"pages#index"
	get "about", to: "pages#about"
	get "info", to: "pages#info"

	resources :players do 
		get :items, to: "players#items"
		get :exps, to: "players#exps"
	end

	resources :items,except:[:show] do 
	end

	resources :exp,except:[:show] do 
	end

	resources :locations do
	end

	resources :quests,except:[:show] do
	end 

	resources :variants,except:[:show] do
		post :check
	end 


end
