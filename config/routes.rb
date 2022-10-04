Rails.application.routes.draw do

  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get 'users/my_page' => "users#mypage"
    get 'users/edit' => "users#edit"
    patch 'users' => "users#update"
    get 'users/unsubscribe'     => "users#unsubscribe"
    patch 'users/withdraw'      => "users#withdraw"
    get 'articles/:id/favorites' => "favorites#index", as: :favorites_user
    get 'category/:id' => "categories#index", as: :categories
    get 'users/0' => "users#show_admin"

    resources :users, only: [:show, :edit]
    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    get 'articles/:id/favorites' => "favorites#index", as: :favorites_user
    get 'category/:id' => "categories#index", as: :categories
    get 'users/0' => "users#show_admin"
    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
    resources :categories, only: [:new, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end

  #ゲストユーザー用
  post '/guests/guest_sign_in', to: 'public/guests#new_guest'



end
