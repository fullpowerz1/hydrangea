Rails.application.routes.draw do
  # 会員用1
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 会員用2
  scope module: :public do
    root :to => "homes#top"
    get "about"=> "homes#about", as: "about"
    get "schedule"=> "homes#schedule", as: "schedule"
    get "history"=> "homes#history", as: "history"

    # 会員機能
    resources :customers, only: [:show, :edit]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    # ここまで会員機能

    resources :pictures, only: [:index,:show]

    resources :orders, only: [:index,:show,:new]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "admin"=> "admin/homes#top", as: "admin"

  namespace :adimin do
    resources :pictures, only: [:index,:show,:edit,:new]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
