# -*- encoding : utf-8 -*-
RedTable::Application.routes.draw do

  get '/admin' => 'admin#index'

  devise_for :users
  resources :users

  resource :imageboard, only: [:edit, :update, :show] do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'

    resources :sections
  end

  resources :sections

  root to: 'imageboards#show'

end
