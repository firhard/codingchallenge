Rails.application.routes.draw do

  root to: "categories#index"
  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
