Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # ゲストログイン機能
   devise_scope :user do
     post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
   end
  # ここまで

  # rootメソッドでtopアクションのviewをrootに設定
  root to: 'homes#top'

  get "/out" =>"parents#out"
  patch "/withdraw" =>"parents#withdraw"
  # ルーティングを一括生成
  resources :babies
  resources :calendars
  resources :parents
  resources :sharing_codes
  resources :blogs
end
