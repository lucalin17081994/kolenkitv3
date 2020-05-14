Rails.application.routes.draw do
  devise_for :users
  resources :bestellings
  resources :carts
  resources :product_sauces
  resources :sauces
  resources :products
  root 'order#index'
  post '/', to:'order#add_to_cart'
  delete '/', to: 'order#delete_from_cart'
  get 'product_sauces/:id/edit', to:'order#edit_item', as: :edit_item
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
