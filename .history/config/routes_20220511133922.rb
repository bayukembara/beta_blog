Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  get 'articles/new'
  get 'articles/edit'
  get 'articles/create'
  get 'articles/update'
  get 'article/index'
  root "pages#home"
  get 'about',to: 'pages#about'
  resources :articles
  resources :users
end
