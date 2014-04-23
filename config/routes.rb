Apollo::Application.routes.draw do

  resources :comments

  resources :items

  resources :products

  resources :projects do
    resources :items
    resources :comments
  end

  resources :tasks

  devise_for :users

  resources :users

  authenticated :user do
    root :to => "tasks#myTasks", as: :authenticated_root
  end

  root :to => "pages#home"

  get '/projects', to: "projects#index"
  get '/projects/new', to: "projects#new"
  get '/tasks', to: "tasks#index"
  get '/users', to: "users#index"

  get 'calendar', to: "pages#calendar"
  get 'myCalendar', to: "pages#myCalendar"

  get 'myProjects', to: "projects#myProjects"
  get 'myTasks', to: "tasks#myTasks"

  match '/tasks/:id/complete' => "tasks#complete", :as => :complete_task, via: [:post]
  match '/tasks/:id/uncomplete' => "tasks#uncomplete", :as => :uncomplete_task, via: [:post]

  match '/projects/:id/complete' => "projects#complete", :as => :complete_project, via: [:post]
  match '/projects/:id/uncomplete' => "projects#uncomplete", :as => :uncomplete_project, via: [:post]

  match '/projects/:id/toggle_starred' => "projects#toggle_starred", :as => :toggle_starred_project, via: [:post]
  match '/tasks/:id/toggle_starred' => "tasks#toggle_starred", :as => :toggle_starred_task, via: [:post]


end
