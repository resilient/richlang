Richlang::Application.routes.draw do
  resources :words

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  root :to => 'home#index'
end
