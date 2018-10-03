Rails.application.routes.draw do
  root "articles#index"

  devise_for :admins
  resources :articles
  get "archive", to: "articles#archive"
  get "dashboard", to: "admins#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
