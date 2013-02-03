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

  scope "/:shortcut" do
    resources :branches
    resources :replies
  end

  get '/:shortcut/:number' => 'replies#index', as: 'thread'
  get '/:shortcut' => 'branches#index', as: 'shortcut'

  root to: 'imageboards#show'

end
