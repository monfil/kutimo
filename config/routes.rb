Rails.application.routes.draw do

  get    'sessions/new'

	root   'static_pages#home'

  get    'users/new'

	get    'static_pages/home'
	
	get    '/signup',     to: 'users#new'

	post   'signup',      to: 'users#create'

	get    '/login',      to: 'sessions#new'

	post   '/login',      to: 'sessions#create'

	delete '/logout',     to: 'sessions#destroy',      as: 'logout'

	get     '/signedup',  to: 'static_pages#signedup'

	get     '/penalty',   to: 'vulgarity#add',         as: 'vulgarity'

	get     '/dashboard', to: 'dashboard#show',        as: 'dashboard'

	get     '/goals',     to: 'goals#goals_options',    as: 'goals'

	get     '/user_goals', to: 'goals#user_goals', as: 'user_goals'

	delete '/user_goals/:user_id/:goal_id', to: 'goals#destroy', as: 'goal'

	resources :users

end