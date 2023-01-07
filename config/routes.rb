Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  get 'posts/done' => 'posts#done'
  #追記 ユーザーマイページへのルーティング
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'
  # put 'posts/:id' => 'posts#buy'
  # get 'posts/done' => 'posts#done'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :purchases, only: [:create, :destroy]
  end
  root 'posts#index'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  get 'rooms' => 'rooms#index'
end
