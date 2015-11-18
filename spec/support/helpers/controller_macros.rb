module ControllerMacros
#   def login_admin
#     before(:each) do
#       request.env['omniauth.auth'] = auth_mock
#       sign_in FactoryGirl.create(:admin) # Using factory girl as an example
#     end
#   end

#   def login_user
#     before(:each) do
#      request.env['omniauth.auth'] = auth_mock
#       user = FactoryGirl.create(:user)
#       #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
#       sign_in user
#     end
#   end
#   def valid_session
#   controller.stub!(:authorize).and_return(User)
# end
def login(user)
  OmniAuth.config.mock_auth[:github] = { 'provider' => 'github', 'uid' => user.id }
  post '/auth/identity/callback'
end
end