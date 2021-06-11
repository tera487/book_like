Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  namespace :admins do
    root "posts#index"
    resources :posts, only: [:index, :destroy] do
      get :reports_posts, on: :collection
    end
    resources :users, only: [:show, :destroy]
    resources :articles, except: [:show]
  end

  namespace :users do
    root "posts#index"
    resources :posts do
      resources :nice_posts, only: [:create, :destroy]
      resources :reports, only: [:create, :destroy]
    end

    resources :books, only: [:show, :index] do
      get "search", on: :collection
    end
    resources :articles, only: :index

    resources :read_book, only: :show

    resources :users, only: :show do
      member do
        get :following, :follower
      end
    end
  end




end
