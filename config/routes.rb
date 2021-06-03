Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users
  resources :timeposts do
    resources :comments, only: %i[create destroy]
    resources :time_likes, only: %i[create destroy]
  end
  resources :methodposts 
  resources :relationships, only: %i[create destroy]
  root 'users#top'
end
