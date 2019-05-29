Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
 
  root 'items#index'
  resources :items, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new, :edit]
  get "items/buy/123456789" =>"items#buy"
  # ログアウトページ（内田）
  get 'users/logout/123456789'       => 'users#logout'
  get "items/search/123" => "items#search"

  #pay.jp
  resources :cards, only: [:index, :new, :destroy] do
    collection do
      post 'purchase'
      get 'buy'
      post 'pay'
    end
  end
end
