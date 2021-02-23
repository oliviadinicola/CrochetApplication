Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'
  resources :projects

  get 'home', to:'projects#home'
  get 'profile', to:'projects#profile'
  get 'myprojects', to:'projects#myprojects'
end
