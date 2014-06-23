Apollo::Application.routes.draw do

  resources :comments

  resources :items

  resources :products

  resources :projects do
    resources :items
    resources :comments
  end

  resources :tasks do
    resources :notes
  end

  devise_for :users

  resources :users

  authenticated :user do
    root :to => "projects#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/projects', to: "projects#index"
  get '/projects/new', to: "projects#new"

  get '/tasks', to: "tasks#index"

  get "notes/index"
  get "notes/new"

  get '/users', to: "users#index"

  get 'calendar', to: "pages#calendar"
  get 'myCalendar', to: "pages#myCalendar"

  match '/projects/:id/complete' => "projects#complete", :as => :complete_project, via: [:post]
  match '/projects/:id/uncomplete' => "projects#uncomplete", :as => :uncomplete_project, via: [:post]

  match '/projects/:id/toggle_starred' => "projects#toggle_starred", :as => :toggle_starred_project, via: [:post]

  match '/tasks/:id/toggle_starred' => "tasks#toggle_starred", :as => :toggle_starred_task, via: [:post]


end
