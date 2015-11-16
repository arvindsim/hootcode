require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#index' do
     
    before do
      request.env['omniauth.auth'] = auth_mock
    end

    it "shows all activities for signed in user" do
      user = FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to eq([user])     
    end  
  end  
end
