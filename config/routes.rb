Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: "home#index"

  resources :transactions do
    collection do
      get :new
      get :index
      get :bill_payment
      get :account
      get :agent_registration
      get :help
    end
  end
  resources :wallets
  resources :pins do
    collection do
      get :new
    end
  end
  # resources :wallets
  # resources :pins
  resources :reloads
  resources :international_top_ups
end
