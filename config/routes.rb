Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  delete 'logout' => 'sessions#destroy'

  resources :sessions, only: [:new, :show]
  resource :balance_sheet, only: [:show]

  get '/', to: 'home#show'
end
