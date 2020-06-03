require 'rails_helper'

RSpec.describe User, type: :model do
  before(:context) do
    @user_test = build(:user)
  end

  it 'should be valid' do
    expect(@user_test).to be_valid
  end

  it 'should be have a user role when created' do
    expect(@user_test.role).to eq('user')
  end

  it '#methods return a string' do
    expect(@user_test.email).to match('user@spendekollektor.com')
    expect(@user_test.role).to match('user')
    expect(@user_test.encrypted_password).to match('')
  end

  it { should respond_to(:email, :role, :encrypted_password) }

  describe 'when fields are empty it should not be valid' do
    before { @user_test.email = '', @user_test.encrypted_password = '' }
    it { should_not be_valid }
  end
end
