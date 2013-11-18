class OmniauthController < ApplicationController
  def callback
    user = User.from_omniauth(auth_hash)
    redirect_to api_v1_user_path(user, token: user.default_token.token)
  end

  def omniauth_failure
    redirect_to new_api_v1_user_path(format: :json)
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
