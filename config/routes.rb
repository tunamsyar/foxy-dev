Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: "home#index"

  resources :transactions do
    collection do
      get :local_top_up
      get :international_top_up
      get :history
      get :bill_payment
      get :account
      get :agent_registration
      get :help
    end
  end
  resources :wallets do
    collection do
      get :e_wallet
    end
  end
  resources :pins do
    collection do
      get :new
    end
  end
end
