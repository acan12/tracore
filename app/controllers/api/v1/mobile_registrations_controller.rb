class Api::V1::MobileRegistrationsController < Api::V1::ApiApplicationController
  
  respond_to :json
    
  def register
    access_token = params[:token]

    @user = User.create_mobile_authentication(access_token)

    respond_with(User.last, :location => api_v1_users_url)
  end
  
  # def create
  #   bizname = params[:bizname]
  #   desc  = params[:description]
  #   event = params[:event]                                               
  #   @business = Businesses.create(:bizname => bizname, :category => "market", :description => desc, :event => event, :created => Time.now)
  #    
  #   respond_with(@business, :location => api_v1_biz_url)         
  # end
  
end