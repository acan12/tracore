Tracore::Application.routes.draw do
  get '/auth/:provider/callback', to: 'omniauth#callback'

  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      
      post "/signin" => "mobile_registrations#register"   
      
      resources :users
      namespace :facebook do
        resources :friends
      end
      
    end
  end
  
  root :to => 'pages#home'
end