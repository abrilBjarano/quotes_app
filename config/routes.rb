# config/routes.rb
Rails.application.routes.draw do
  root "quotes#index" # ¡Esta línea es clave!
  resources :quotes
  # ...
end