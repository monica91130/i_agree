Rails.application.routes.draw do

  get 'user_follows/create'
  get 'user_follows/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  post '/search' => "posts#search", as: "search"

root 'top#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories do
  	resources :category_follows,only: [:create,:destroy]
  end
  resources :posts, only: [:new, :create, :show, :destroy, :index] do
  	resources :agrees, only: [:create, :destroy]
  end
  resources :users do
    get 'follow/:id' => "users#follow_create", as: "follow"
    get 'follow_destroy/:id' => "users#follow_destroy", as: "follow_destroy"
  end



end
