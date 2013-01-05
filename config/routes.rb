RedTable::Application.routes.draw do

  resource :imageboard, :only => [:show]

  root :to => 'imageboards#show'

end
