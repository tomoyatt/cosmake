Rails.application.routes.draw do
  
  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: :public do
    root to: "homes#top"
    
    resources :users, only: [:show, :edit]
    resources :articles, only: [:new, :index, :show, :edit]
    resources :categories, only: [:index]
  end
  
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: "homes#top"
    resources :articles, only: [:new, :index, :show, :edit]
    resources :categories, only: [:new, :index, :edit]
    resources :users, only: [:index, :show, :edit]
  end

end
