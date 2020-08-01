Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  resources:recipes
  resources:users
  resources :users do
    member do
        get "check"
        #ユーザーの会員状況を取得
        patch "withdrawl"
        #ユーザーの会員状況を更新
    end
end
end
