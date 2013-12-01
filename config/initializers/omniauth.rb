Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '616108695094318', 'd8ee2f59d1ef3a49da9aa2bb32b06a79'
           # :scope => 'email,user_birthday,read_stream', :display => 'popup'
  provider :facebook, '616108695094318', 'd8ee2f59d1ef3a49da9aa2bb32b06a79', callback_path: '/auth/facebook/callback'
end

OmniAuth.config.on_failure = Proc.new do |env|
  #this will invoke the omniauth_failure action in UsersController.
  OmniauthController.action(:omniauth_failure).call(env)
end