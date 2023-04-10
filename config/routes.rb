Rails.application.routes.draw do
  # 会員用1
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: "homes#top"

  # 会員用2
  scope module: :public do
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :adimin do

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
