require 'rails_helper'

RSpec.describe UsersController do
  
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "Get 'show' for non-logged in user" do
    it "redirects user to the root path to login" do
      session[:user_id] = nil
      get 'show', :id => @user.id
      #response.should redirect_to(root_path)
      expect(response).to redirect_to(root_path)
    end
  end
  describe "GET 'show' for logged in user" do
    it "returns http success" do
      session[:user_id] = @user.id
      get 'show', :id => @user
      expect(response).to be_success
    end
  end

  describe "GET 'index' for logged in user" do
    it "returns http success" do
      session[:user_id] = @user.id
      get 'index', :id => @user
      expect(response).to be_success
    end
  end

end
