Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#following', as: 'following'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

end