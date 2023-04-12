Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'pictures/index'
    get 'pictures/show'
  end
  # 会員用1
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }



  # 会員用2
  scope module: :public do
    root :to => "homes#top"

    # 会員機能
    resources :customers, only: [:show, :edit]
    get 'customers/unsubscribe' => 'customers#unsubscribe'

    resources :pictures, only: [:index,:show]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :adimin do

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
