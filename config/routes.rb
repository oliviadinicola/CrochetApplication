Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#home'
  resources :projects do 
    resources :likes
  end

  get 'home', to:'projects#home'
  get 'profile', to:'users#profile'
  get 'myprojects', to:'projects#myprojects'

end
