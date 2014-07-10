Findpather::Application.routes.draw do

  resources :users do
    resources :spells
    resources :custom_spells
  end

  root 'pages#index'

  get '/auth/:provider/callback', to: 'users#create'
  get '/logout', to: 'users#log_out'

end
