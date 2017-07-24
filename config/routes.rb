Rails.application.routes.draw do

	root 'static_pages#home'

  get 'users/new'

	get 'static_pages/home'
	
	get '/signup', to: 'users#new'

	post 'signup', to: 'users#create'

	resources :users

end