Rails.application.routes.draw do

  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: :public do
    root to: "homes#top"
    get 'users/unsubscribe'     => "users#unsubscribe"
    get 'articles/:id/favorites' => "favorites#index", as: :favorites_user
    get 'category/:id' => "categories#index", as: :categories
    get 'user/mypage' => "users#mypage", as: :mypage
    get 'users/0' => "users#show_admin"
    resources :users, only: [:show, :edit, :update, :destroy]
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
    post 'categories/new' => "categories#create"
    get 'users/0' => "users#show_admin"
    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
    resources :categories, only: [:new, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  #ゲストユーザー用
  post '/guests/guest_sign_in', to: 'public/guests#new_guest'



end
