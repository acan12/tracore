class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  validates_presence_of :email, :username, :password

  has_many :authentifications

  before_save :before_save_callback
  before_create :before_create_callback

  # created by -Ary
  def self.create_mobile_authentication(access_token)
    graph = Koala::Facebook::API.new(access_token)
    profile = graph.get_object("me")
    
    user = User.where(username: profile["username"]).first
    if user.blank?
      user = new do |u|
        u.username = profile["username"]
        u.email = "admin@traco.com"
        u.password = Digest::MD5.hexdigest(SecureRandom.hex(4))
        u.token = SecureRandom.hex
        u.mobile = true
      end
      user.save
    end
    profile["token"] = access_token
    user.authentifications.credential_from_mobile!(profile) if user.try(:authentifications).blank?
  end
  
  
  def self.from_omniauth(auth_hash)
    user = where(email: auth_hash.info.email).first
    if user.blank?
      user = new do |u|
        u.username = auth_hash.info.nickname
        u.email = auth_hash.info.email
        u.password = Digest::MD5.hexdigest(SecureRandom.hex(4))
        u.token = SecureRandom.hex
        u.web = true
      end
      user.save
    end
    
    user.authentifications.credential_from_omniauth!(auth_hash) if user.try(:authentifications).blank?

    # user.authentifications.build_token!
    user
  end

  # def self.user_token(token)
  #   a = Authentification.where(provider: "tracore", uid: "tracore", token: token).first
  #   a.present? ? a.user : nil
  # end

  def default_token
    # authentifications.where(provider: "tracore", uid: "tracore").first
    self.token
  end

  def facebook
    a = authentifications.where(provider: 'facebook').first
    @facebook ||= Koala::Facebook::API.new(a.try(:token))
  end

  
  
  private
  def before_save_callback
    self.password = Digest::MD5.hexdigest(self.password) if password_changed?
  end

  def before_create_callback
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
