Rails.application.routes.draw do
 
  get 'comments/new'

  resources :posts

root "home#index"

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'users/registrations' }

end
