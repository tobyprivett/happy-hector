Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :sessions, only: [:new, :show]
  delete 'logout' => 'sessions#destroy'
  get '/', to: 'home#show'
end
