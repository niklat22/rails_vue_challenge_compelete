Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/users/:user_id/projects', to: 'projects#create', as: :project_create
  get '/users/:user_id/projects', to: 'projects#index'
  post '/users/:user_id/projects/:id/add', to: 'projects#add'
  get '/users/:user_id/projects/new', to: 'projects#new'

  root to: 'landing#index'
end
