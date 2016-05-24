Rails.application.routes.draw do
  root to: 'searches#index'
  get 'search' => 'searches#index'
  resources :show, only: [:index, :show]
end
