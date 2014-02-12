Findpather::Application.routes.draw do

  resources :spells

  root 'spells#index'

end
