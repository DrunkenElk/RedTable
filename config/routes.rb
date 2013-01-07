# -*- encoding : utf-8 -*-
RedTable::Application.routes.draw do

  devise_for :users
  resources :users

  get '/admin' => 'admin#index'

  resource :imageboard, only: [:edit, :update, :show] do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'

    resources :sections
  end

  resources :sections do
    resources :boards
  end

  resources :boards

  root to: 'imageboards#show'

end
