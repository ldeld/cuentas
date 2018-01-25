Rails.application.routes.draw do

  get 'debts_controller/index'

  get 'debts_controller/show'

  get 'debts_controller/new'

  get 'debts_controller/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#home'
  resources :users do
    resources :facturas
  end
end
