class Api::V1::UsersController < Api::V1::BaseController
  before_filter :require_token!, except: [:new, :create]

  respond_to :json

  def new
    @user = User.new
    respond_with @user
  end

  def show
    respond_with current_user
  end
end
