# Access from web connections
class OmniauthController < ApplicationController
  def callback
    user = User.from_omniauth(auth_hash)
    render json: { "token" => user.default_token, "user-agent" => 'web' }
  end

  def omniauth_failure
    redirect_to new_api_v1_user_path(format: :json)
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
