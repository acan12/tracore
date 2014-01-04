class Api::V1::BaseController < ::ApplicationController
  before_filter :set_headers
  
  
  def set_headers
    puts 'ApplicationController.set_headers'
    if request.headers["HTTP_ORIGIN"]     
    # better way check origin
    # if request.headers["HTTP_ORIGIN"] && /^https?:\/\/(.*)\.some\.site\.com$/i.match(request.headers["HTTP_ORIGIN"])
      headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
  
  
  protected
  def require_token!
    return render json: {}, status: :unauthorized if !current_user
  end

  def current_user
    @user ||= User.user_token(params[:token])
  end
end
