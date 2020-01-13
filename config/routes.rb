Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "home#register"

  get "/login/" => "home#login"

  get "/test/" => "test#questions"

  get "/outcome/" => "outcome#results"

  

end
