Tracore::Application.routes.draw do
  devise_for :users



  
  
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :tokens, :only => [:create, :destroy], :defaults => {:format => 'json'}
      match 'register' => 'mobile_registrations#create', :via => 'post', :defaults => {:format => 'json'} 
      match 'member' => 'member#show'
      match 'allmember' => 'member#index'
      
      # devise_scope :user do
      #    match "registerx" => "mobile_registrations#create", :via => 'post', :as => :user_register
      # end
    end
  end
  
  
  
end
