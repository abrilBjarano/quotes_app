# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root "quotes#index" # ¡Esta línea es clave!
  resources :quotes
  # ...
end