Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]
  get 'about' => 'welcome#about'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  root 'welcome#index'
end
