Rails.application.routes.draw do
  root to: 'searches#index'
  get 'search' => 'searches#index'
  resources :shows, only: [:index, :show]

  namespace :api, defaults: { format: 'json' } do
    get 'search' => 'search#index'
    get 'shows/:id' => 'shows#show'
  end
end
