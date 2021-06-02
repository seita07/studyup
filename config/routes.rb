Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users
  resources :timeposts do
    resources :time_likes, only: %i[create destroy]
  end
  root 'users#top'
end
