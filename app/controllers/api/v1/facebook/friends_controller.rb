class Api::V1::Facebook::FriendsController < Api::V1::BaseController
  before_filter :require_token!
  def index
    friends = current_user.facebook.get_connections 'me', 'friends'
    render json: friends.map{|f| current_user.facebook.get_object(f['id']) }.to_json
  end
end 
