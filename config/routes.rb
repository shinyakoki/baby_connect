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
    get '/users', to: 'users/registrations#index'
  end

  # rootメソッドでtopアクションのviewをrootに設定
  root to: 'homes#top'

  get "/timer" => "parents#timer"
  get "/out" => "parents#out"
  patch "/withdraw" => "parents#withdraw"

  resources :babies
  resources :calendars
  resources :parents
  resources :sharing_codes
  resources :blogs

  get "/babies/:id/new_record" => "babies#new_record", as: "new_record"
  post "/babies/:id/create_record" => "babies#create_record"
  post "/babies/:id/next_day" => "babies#next_day"
  post "/babies/:id/back_day" => "babies#back_day"
end