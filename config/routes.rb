Rails.application.routes.draw do
	resources :users, only: [:new, :index, :create, :show]

	resources :events, only: [:new, :show, :create, :index]

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	root 'events#index'
end