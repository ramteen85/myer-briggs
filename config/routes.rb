Rails.application.routes.draw do

  get 'scores/new'
  get 'scores/create'
  get 'scores/edit'
  get 'scores/destroy'
  root :to => "home#index"

  get "/login" => "session#new"

  post "/login" => "session#create" #submit login form / check creds

  delete "/login" => "session#destroy"

  get "/register" => "users#new"

  post "/test/" => "test#questions"
  get "/test/" => "test#questions"

  get "/outcome/" => "outcome#results"

  resources :users

end
