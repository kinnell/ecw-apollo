Apollo::Application.routes.draw do

  resources :items

  resources :products

  resources :projects

  resources :tasks

  devise_for :users

  resources :users

  authenticated :user do
    root :to => "projects#index", as: :authenticated_root
  end
    root :to => "pages#home"

  get '/projects', to: "projects#index"
  get '/projects/new', to: "projects#new"
  get '/tasks', to: "tasks#index"
  get '/users', to: "users#index"
  get 'dashboard', to: "pages#dashboard"
  get 'calendar', to: "pages#calendar"

  match '/tasks/:id/complete' => "tasks#complete", :as => :complete_task, via: [:post]
  match '/tasks/:id/uncomplete' => "tasks#uncomplete", :as => :uncomplete_task, via: [:post]

end
