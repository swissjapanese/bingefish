Rails.application.routes.draw do
  root to: 'searches#index'
  get 'search' => 'searches#index'
  resources :show, only: [:index, :show]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'search' => 'search#index'
      get 'shows/:id' => 'shows#show'
    end
  end
end
