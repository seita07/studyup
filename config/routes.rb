Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users
  resources :timeposts do
    resources :comments, only: %i[create destroy]
    resources :time_likes, only: %i[create destroy]
  end
  resources :methodposts do
    resources :methodlike, only: %i[create destroy]
    resources :reviews, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
  root 'users#top'
end
