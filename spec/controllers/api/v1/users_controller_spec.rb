require 'spec_helper'

describe Api::V1::UsersController do
  context '#new' do 
    before(:each) do 
      get :new, format: :json
    end
    it { should respond_with(200) }
    it "should assign user object" do 
      expect(assigns(:user)).to be_a_new(User)
    end
  end
end
