Findpather::Application.routes.draw do

  resources :users do
    resources :spells
  end

  root 'spells#index'

end
