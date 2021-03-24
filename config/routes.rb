Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#home'
  resources :projects do 
    resources :comments
    resources :likes, only: [:new, :create, :destroy]
  end

  get 'home', to:'projects#home'
  get 'profile', to:'users#profile'
  get 'myprojects', to:'projects#myprojects'

end
