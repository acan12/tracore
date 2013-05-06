# module Api::V1
class Api::V1::MemberController < ::Devise::RegistrationsController
  # skip_authorize_resource
  # skip_authorization_check
  skip_before_filter :verify_authenticity_token, :only => :create
  # doorkeeper_for :all
  
  respond_to :json

  def create
    
    respond_to do |format|  
      format.html { 
        super 
      }
      format.json {
        build_resource
        if resource.save
          render :status => 200, :json => resource
        else
          render :json => resource.errors, :status => :unprocessable_entity
        end
      }
    end
  end
  
  def show
    respond_with User.all
    # respond_with current_resource_owner
  end
end
# end


# class Api::V1::RegistrationController #< Devise::RegistrationsController
#   # skip_before_filter :verify_authenticity_token, :only => :create
#   respond_to :json
#   
#   def create
#     super
#   end
#   
#   def show
#     User.all
#   end
# end