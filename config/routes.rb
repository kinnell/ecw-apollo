Apollo::Application.routes.draw do

  devise_for :users
  resources :users, only: [:index]

  resources :products, only: [:index, :edit, :create, :update, :destroy]

  resources :projects, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :tasks, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :items, only: [:new, :edit, :create, :update, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :print_jobs, only: [:index, :create, :edit, :update, :destroy]

  root to: "projects#index"

  get "calendar", to: "pages#calendar"
  get "changelog", to: "pages#changelog"

  match "/projects/:id/complete" => "projects#complete", :as => :complete_project, via: [:post]
  match "/projects/:id/uncomplete" => "projects#uncomplete", :as => :uncomplete_project, via: [:post]
  match "/projects/:id/toggle_starred" => "projects#toggle_starred", :as => :toggle_starred_project, via: [:post]
  match "/tasks/:id/toggle_starred" => "tasks#toggle_starred", :as => :toggle_starred_task, via: [:patch]

end
