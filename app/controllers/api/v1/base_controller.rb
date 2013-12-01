class Api::V1::BaseController < ::ApplicationController
  protected
  def require_token!
    return render json: {}, status: :unauthorized if !current_user
  end

  def current_user
    @user ||= User.user_token(params[:token])
  end
end
