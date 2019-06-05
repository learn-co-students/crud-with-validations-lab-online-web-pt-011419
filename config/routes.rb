Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  root 'songs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
