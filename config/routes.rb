Rails.application.routes.draw do
  devise_for :users
  get 'current_user' => "bestellings#get_current_user"
  resources :bestellings
  resources :carts
  resources :product_sauces
  resources :sauces
  resources :products
  root 'order#index'
  post '/', to:'order#add_to_cart'
  delete '/', to: 'order#delete_from_cart'
  patch '/', to:'order#diminish'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
