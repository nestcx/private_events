Rails.application.routes.draw do
	resources :users, only: [:new, :index, :create, :show]

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	root 'users#index'
end