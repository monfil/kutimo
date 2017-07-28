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

	get     '/new_goal',   to: 'goals#new', as: 'new_goal'

	post     '/user/:user_id/new',  to: 'goals#create', as: 'create_goal'

	delete  '/user_goals/:user_id/:goal_id', to: 'goals#destroy', as: 'goal'

	get '/edit/:goal_id', to: 'goals#edit', as: 'edit_goal'

	post '/update/:id', to: 'goals#update', as: 'update_goal'

	get '/add_goal/:user_id', to: 'goals#show_goals', as: 'add_goal'

	get '/user/:user_id/goal/:goal_id/add_goal_user', to: 'goals#add_goal', as: 'add_goal_user'

	delete '/restart_goal_record/:user_id/:goal_id', to: 'goals#restart_goal_record', as: 'restart_goal'

	put '/mark_goal/:user_id/:goal_id', to: 'goals#mark_goal', as: 'goal_done'

	get     '/rewards',     to: 'rewards#show',    as: 'rewards'

	delete '/user/:user_id/rewards/:reward_id/', to: 'rewards#destroy', as: 'delete_reward'

	resources :users, :rewards

end