Rails.application.routes.draw do
  get "products/search", to: "products#index", :as => 'search_page'
  get "wishlists", to: "wishlists#index", as: :wishlists
  get "wishlists/new", to: "wishlists#new"
  post 'wishlists', to:'wishlists#create'
  delete "wishlists/:id", to: "wishlists#destroy", :as => 'delete_wishlist'

  devise_for :users
  root to: 'pages#home', as: :root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
