Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :activities, only: [] do
    collection do
      post 'calculate_price', to: 'activities#calculate_price'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:index, :new, :create, :edit, :update, :show] do
    resources :experience_slices, only: [:new, :create, :edit, :update]
    resources :payments, only: :new
  end


end
