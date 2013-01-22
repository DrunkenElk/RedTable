# -*- encoding : utf-8 -*-
RedTable::Application.routes.draw do

  devise_for :users
  resources :users

  scope 'admin', as: :admin do
    get '/' => 'admin#index'
  end

  resource :imageboard, only: [:edit, :update, :show] do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'

    resources :sections
  end

  resources :sections do
    resources :boards, except: :index
  end

  resources :boards, except: :index

  get '/:shortcut/:page' => 'posts#index'
  get '/:shortcut/:post' => 'posts#show', as: 'thread'
  get '/:shortcut' => 'posts#index', as: 'shortcut'

  scope "/:shortcut" do
    resources :posts, only: [:index, :show, :create, :destroy]
  end

  root to: 'imageboards#show'


end
