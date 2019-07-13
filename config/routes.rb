Rails.application.routes.draw do
  root "posts#index"

  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }

  resources :posts
end
