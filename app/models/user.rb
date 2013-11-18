class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  validates_presence_of :email, :username, :password

  has_many :authentifications

  def self.from_omniauth(auth_hash)
    user = new do |u|
      u.username = auth_hash.info.nickname
      u.email = auth_hash.info.email
      u.password = Digest::MD5.hexdigest(SecureRandom.hex(4))
    end
    user.save
    user.authentifications.from_omniauth!(auth_hash)
    user.authentifications.build_token!
    user
  end

  def self.user_token(token)
    a = Authentification.where(provider: "tracore", uid: "tracore", token: token).first
    a.present? ? a.user : nil
  end

  def default_token
    authentifications.where(provider: "tracore", uid: "tracore").first
  end
end
