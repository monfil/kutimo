Rails.application.routes.draw do

  get    'sessions/new'

	root   'static_pages#home'

  get    'users/new'

	get    'static_pages/home'
	
	get    '/signup',   to: 'users#new'

	post   'signup',    to: 'users#create'

	get    '/login',    to: 'sessions#new'

	post   '/login',    to: 'sessions#create'

	delete '/logout',   to: 'sessions#destroy', as: 'logout'

	get     '/signedup', to: 'static_pages#signedup'

	resources :users

end