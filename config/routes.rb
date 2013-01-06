RedTable::Application.routes.draw do

  resource :imageboard, defaults: { format: 'html' } do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'
  end

  root to: 'imageboards#show'

end
