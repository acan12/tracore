module Api::V1
  class MemberController < ApiController
    doorkeeper_for :all, :except => :index
    # doorkeeper_for :index
  
    respond_to :json

    def show
      respond_with current_user.as_json(except: :email)
    end
    
    def index
      respond_with User.all
    end
  end
end
