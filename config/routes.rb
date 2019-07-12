Rails.application.routes.draw do
  root "posts#index"

  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

  resources :posts, only: :show
end
