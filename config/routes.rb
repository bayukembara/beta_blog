Rails.application.routes.draw do
  get "articles/index"
  get "articles/show"
  get "articles/new"
  get "articles/edit"
  get "articles/create"
  get "articles/update"
  get "article/index"
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles
  get "signup", to: "users#new"
  resources :users
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
