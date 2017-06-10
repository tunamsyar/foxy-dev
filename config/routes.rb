Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: "home#index"

  resources :transactions do
    collection do
      get :local_top_up
      get :international_top_up
    end
  end
  resources :wallets
  resources :pins
end
