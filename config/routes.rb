Rails.application.routes.draw do
  authenticated :user do
    get '/dashboard', to: 'dashboard#show'
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
    resources :challenge_steps, as: "steps", shallow: true
    resources :comments, as: "comments", shallow: true
  end
  resources :user_actions,       only: [:create, :destroy]
  get '/privacy', to: 'pages#privacy'
  get '/terms', to: 'pages#terms'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/500', to: 'errors#server_error'
  get '/422', to: 'errors#unacceptable'
  get '/404', to: 'errors#not_found'
  get 'refer-a-friend', to: 'pages#refer'

  devise_for :users, path: "/", path_names: { sign_up: "signup", sign_in: "login", sign_out: "logout", edit: "edit", invitation: "invite" }, controllers: {
    sessions: 'users/sessions', invitations: 'users/invitations', confirmations: 'users/confirmations', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: 'users/registrations#new'
  end

end
