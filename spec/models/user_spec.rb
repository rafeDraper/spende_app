RSpec.describe User, type: :model do
  before(:example) do
    @test_user = create(:user)
  end

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
    expect(user.set_default_role).to eq('user')
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

  it '#methods return a string' do
    expect(@test_user.email).to match('user@spendekollektor.com')
    expect(@test_user.role).to match('user')
    expect(@test_user.encrypted_password).to match('')
  end

  it { expect(@test_user).to respond_to(:email, :role, :encrypted_password) }

  describe 'when fields are empty it should not be valid' do
    before { @test_user.email = '', @test_user.encrypted_password = '' }
    it { should_not be_valid }
  end

end
