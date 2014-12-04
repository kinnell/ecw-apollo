Apollo::Application.routes.draw do

  devise_for :users
  resources :users, only: [:index]

  resources :products, only: [:index, :edit, :create, :update, :destroy]

  resources :projects, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :items, only: [:edit, :create, :update, :destroy]
    resources :tasks, only: [:edit, :create, :update, :destroy] do
      patch :toggle_starred, on: :member
      patch :toggle_completed, on: :member
    end
    resources :comments, only: [:create, :destroy]
  end

  resources :print_jobs, only: [:index, :create, :edit, :update, :destroy]

  root to: "projects#index"

  get "calendar", to: "pages#calendar"
  get "changelog", to: "pages#changelog"

end
