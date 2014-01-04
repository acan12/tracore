class Authentification < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user

  def self.credential_from_omniauth!(auth_hash)
    auth = new do |a|
      a.provider = auth_hash.provider
      a.uid = auth_hash.uid
      a.token = auth_hash.credentials.token
      a.secret = auth_hash.credentials.secret
      a.expires_at = auth_hash.credentials.expires_at
    end
    auth.save
    auth
  end
  
  def self.credential_from_mobile!(profile)
    auth = new do |a|
      a.provider = 'facebook'
      a.uid = profile["id"]
      a.token = profile["token"]
    end
    auth.save
    auth
  end

  # def self.build_token!
  #   auth = new do |a|
  #     a.provider = "tracore"
  #     a.uid = "tracore"
  #     a.token = SecureRandom.hex
  #     a.secret = SecureRandom.hex
  #   end
  #   auth.save
  #   auth
  # end
end
