Tracore::Application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   match "/api/v1/register" => "devise/registrations#create"
  # end
  # scope :module => "api/v1" do
  #   devise_for :users, :controllers => { 
  #     :member => "member"
  #   }
  # end



  
  
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :tokens, :only => [:create, :destroy], :defaults => {:format => 'json'}
      match 'register' => 'mobile_registrations#create', :via => 'post', :defaults => {:format => 'json'} 
      # match 'member' => 'member#create', :via => :post, :defaults => { :format => "json" }
      # match 'member' => 'member#show'
      
      # devise_scope :user do
      #    match "registerx" => "mobile_registrations#create", :via => 'post', :as => :user_register
      # end
    end
  end
  
  
  
end
