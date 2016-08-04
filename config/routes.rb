Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'searches#index'
  get 'search' => 'searches#index'
  resources :shows, only: [:index, :show]

  namespace :api, defaults: { format: 'json' } do
    get 'search' => 'search#index'
    get 'shows/:id' => 'shows#show'
  end
end
