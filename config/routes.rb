Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'searches#index'
  get 'search' => 'searches#index'
  resources :shows, only: [:index, :show]

  namespace :api, defaults: { format: 'json' } do
    get 'search' => 'search#index'

    # show api
    get 'shows/:id' => 'shows#show'

    # bingelist api
    get 'show/:id/status' => 'binge_list#show'
    put 'show/:id/status' => 'binge_list#update'
  end
end
