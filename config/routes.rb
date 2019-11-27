Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:index, :new, :create, :edit, :update, :show] do
    resources :experience_slices, only: [:new, :create]
    resources :payments, only: :new
  end
end
