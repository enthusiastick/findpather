Findpather::Application.routes.draw do

  resources :users do
    resources :spells
  end

  root 'pages#index'

  get '/auth/:provider/callback', to: 'users#create'

end
