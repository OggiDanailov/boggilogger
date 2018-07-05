Rails.application.routes.draw do
 
  
  get 'users/show'

	get "/users/profile/:id" => "users#show"
root "home#index"
  resources :posts
  resources :comments, only: [:new, :create]

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'users/registrations' }

end
