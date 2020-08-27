Rails.application.routes.draw do
  get "products/search", to: "products#index", :as => 'search_page'
  get "wishlists", to: "wishlists#index"
  delete "wishlists/:id", to: "wishlists#destroy"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
