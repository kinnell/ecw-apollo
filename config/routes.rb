Apollo::Application.routes.draw do

  devise_for :views
  devise_for :users
  root "pages#home"

  get '/projects', to: "projects#index"

end
