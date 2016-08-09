Rails.application.routes.draw do

  resources :products
  resources :orders
  resources :shopping_lists, only: [:index, :show, :create]
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
