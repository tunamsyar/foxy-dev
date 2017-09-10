Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: "home#index"

  resources :transactions
  resources :wallets
  resources :pins do
    collection do
      get :new
    end
  end
  resources :reloads
  resources :international_top_ups
end
