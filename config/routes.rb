Rails.application.routes.draw do
  root to: 'static_pages#index'
  resources :show, only: [:index, :show]
end
