Rails.application.routes.draw do
  resources :questions, only: :index
  resources :user_answers, only: :create
end
