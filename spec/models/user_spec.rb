RSpec.describe User, type: :model do
  it 'is valid' do
    user = User.new(
      email: 'rafa@gmail.com',
      password: 'badabumts123'
    )
    expect(user).to be_valid
  end

  it 'is invalid without email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include('muss ausgefüllt werden')
  end

  it 'has a role when initialized' do
    user = User.new(
      email: 'rafa@gmail.com',
      password: 'badabumts123'
    )
    expect(user.role).to eq('user')
  end

  it 'is invalid when duplicate email address' do
    User.create(
      email: 'rafa@gmail.com',
      password: 'badabumts123'
    )
    user = User.new(
      email: 'rafa@gmail.com',
      password: 'badabumts123'
    )
    user.valid?
    expect(user.errors[:email]).to include('ist bereits vergeben')
  end

  xit '#methods return a string' do
    expect(@user_test.email).to match('user@spendekollektor.com')
    expect(@user_test.role).to match('user')
    expect(@user_test.encrypted_password).to match('')
  end

  xit { should respond_to(:email, :role, :encrypted_password) }

  xdescribe 'when fields are empty it should not be valid' do
    before { @user_test.email = '', @user_test.encrypted_password = '' }
    it { should_not be_valid }
  end
end
