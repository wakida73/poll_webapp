Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  get 'groups/index'
  root 'polls#index'
  

  #devise_for :users
  
  get 'poll/new' => 'polls#new'

  
  
  #root to: 'polls#index'



  resources :polls do
    resources :lists
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
