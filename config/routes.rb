RedTable::Application.routes.draw do

  resource :imageboard do #, defaults: { format: 'html' }, :format => /(xml|json|html)/ do
    get 'about'
    get 'news'
    get 'faq'
    get 'rules'
  end

  root to: 'imageboards#show'

end
