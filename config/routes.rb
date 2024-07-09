Rails.application.routes.draw do
  resources :posts, only: %i[index show]

  get 'writer/dashboard', to: 'writer#dashboard'
  namespace :writer do
    resources :posts do
      member do
        patch :submit
      end
    end
  end

  resources :tags, only: %i[index show]

  namespace :admin do
    resources :posts, only: %i[index show] do
      member do
        patch :publish
        patch :request_changes
        patch :archive
      end
    end
    resources :tags
    resources :users, only: %i[index new create edit update destroy]
  end

  get 'admin/dashboard', to: 'admin#dashboard'
  root 'posts#index'
  devise_for :users, skip: [:registrations]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
