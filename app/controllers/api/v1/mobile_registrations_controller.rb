class Api::V1::MobileRegistrationsController < Api::V1::ApiController
  # before_filter :authenticate_user!, :only => :token
  # skip_before_filter :verify_authenticity_token, :only => :create
  
  respond_to :json
  
  def new
    super
  end
  
  def create
    @user = User.create!(params[:user])
    @user.ensure_authentication_token!
    
    respond_to do |format|
      format.json { render json: @user }
    end
  end
end