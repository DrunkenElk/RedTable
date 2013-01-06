RedTable::Application.routes.draw do

  devise_for :users

  resource :imageboard, defaults: { format: 'html' } do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'

    resources :sections
  end

  root to: 'imageboards#show'

end
