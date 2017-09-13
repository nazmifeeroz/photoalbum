Rails.application.routes.draw do
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :models
	
	resources :photo_albums do
		resources :photos do
			resources :comments
		end
	end
  root to: "homes#index"
end
