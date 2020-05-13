require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do

    before(:each) { @user = build(:user) }
  
    subject { @user }
  
    it { should respond_to(:email) }
  
    it "#email returns a string" do
      expect(@user.email).to match 'example@example.com'
    end
  
  end
end
