Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :sessions, only: [:new]
  delete 'logout' => 'sessions#destroy'
  get '/', to: 'home#show'
end
