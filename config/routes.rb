Rails.application.routes.draw do
 
  

  resources :posts
  resources :comments, only: [:new, :create]
root "home#index"

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'users/registrations' }

end
