Apollo::Application.routes.draw do

  resources :tasks

  resources :projects

  devise_for :users

  authenticated :user do
    root :to => "projects#index", as: :authenticated_root
  end
    root :to => "pages#home"

  get '/projects', to: "projects#index"
  get '/projects/new', to: "projects#new"
  get '/tasks', to: "tasks#index"
  get '/users', to: "users#index"

end
