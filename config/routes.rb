Rails.application.routes.draw do
  root 'users#top'
  devise_for :users, controllers: {   
    registrations: 'users/registrations',
    sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/guest_sign_in', to: 'users#guest_sign_in'
  end
  resources :users
  resources :timeposts do
    resources :comments, only: %i[create destroy]
    resources :time_likes, only: %i[create destroy]
  end
  resources :methodposts do
    resources :methodlike, only: %i[create destroy]
    resources :methodlike, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
end
