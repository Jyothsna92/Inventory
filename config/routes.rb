Rails.application.routes.draw do
  root to: 'welcome#index'
  
  authenticated :user do
	  root to: 'items#index', as: :authenticated_root
	end
	
	devise_for :users
	scope "/admin" do
	  resources :users
	end
	resources :items
	resources :roles
end
