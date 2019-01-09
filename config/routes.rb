Rails.application.routes.draw do
  authenticated :user do
    root to: 'dashboard#show'
  end
  namespace :admin do
      resources :users
      resources :approvals
      resources :challenges
      resources :challenge_steps
      resources :clam_credits
      resources :contents
      resources :posts
      resources :user_actions

      root to: "users#index"
    end
  resources :posts
  resources :challenges do
    resources :challenge_steps
  end
  get '/privacy', to: 'pages#privacy'
  get '/terms', to: 'pages#terms'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  root to: 'pages#home'
  get '/500', to: 'errors#server_error'
  get '/422', to: 'errors#unacceptable'
  get '/404', to: 'errors#not_found'
  devise_for :users, path: "/", path_names: { sign_up: "signup", sign_in: "login", sign_out: "logout", edit: "edit" }, controllers: {
    sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
