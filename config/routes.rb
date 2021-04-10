Rails.application.routes.draw do
  
  root to: 'projects#home'
  resources :projects do 
    resources :comments
    resources :likes, only: [:new, :create, :destroy]
  end
  
  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/projects/:project_id/likes' => 'likes#create'
  get '/projects/:project_id/likes/:id' => 'likes#destroy'



  get 'home', to:'projects#home'
  get 'profile', to:'users#profile'
  get 'myprojects', to:'projects#myprojects'

  resources  :users do
    resources :projects, only: [:index]
  end
   
   get 'users/:id/user_projects' => 'users#user_projects', :as => :custom_user_projects

end
