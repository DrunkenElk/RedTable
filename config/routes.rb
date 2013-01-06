RedTable::Application.routes.draw do

  get '/admin' => 'admin#index'

  devise_for :users
  resources :users

  resource :imageboard, defaults: { format: 'html' } do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'

    resources :sections
  end

  root to: 'imageboards#show'

end
