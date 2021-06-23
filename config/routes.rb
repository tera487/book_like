Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"

  namespace :admins do
    root "posts#index"
    resources :posts, only: [:index,:show, :destroy] do
      get :reports_posts, on: :collection
    end
    resources :users, only: [:show, :destroy] do
      member do
        get "read_books"
      end
    end
    resources :articles
    resources :read_book, only: :show
    resources :books
  end

  namespace :users do
    root "posts#index"
    resources :books, only: [:show, :index] do
      get "search", on: :collection
      
      resources :posts, only: [:new, :create]
    end
    resources :posts, except: :new do
      resources :likes, only: [:create, :destroy]
      resources :reports, only: [:create, :destroy]
    end

    resources :articles, only: [:index,:show]
    resources :read_book, only: :show

    resources :users, only: :show do
      member do
        get :following, :follower
        get "read_books"
      end
    end
    resources :relationships, only: [:create, :destroy]
  end




end
