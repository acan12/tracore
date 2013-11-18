class Authentification < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user

  def self.from_omniauth!(auth_hash)
    auth = new do |a|
      a.provider = auth_hash.provider
      a.uid = auth_hash.uid
      a.token = auth_hash.credentials.token
      a.secret = auth_hash.credentials.secret
    end
    auth.save
    auth
  end 

  def self.build_token!
    auth = new do |a|
      a.provider = "tracore"
      a.uid = "tracore"
      a.token = SecureRandom.hex
      a.secret = SecureRandom.hex
    end
    auth.save
    auth
  end
end
