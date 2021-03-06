RSpec.describe User, type: :model do
  before(:each) do
    @test_user = FactoryBot.create(:user)
  end

  describe 'validations' do
    context 'valid attributes?' do
      it 'has valid email and password' do
        expect(@test_user).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'without email' do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('muss ausgefüllt werden')
      end


      it 'is invalid with duplicated email' do
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
    end

    context 'user role' do
      it 'initialize as user' do
        expect(@test_user.set_default_role).to eq(0)
      end
    end
  end

  describe 'instance variables' do
    it '#methods return a string' do
      # expect(@test_user.email).to match('user38@spendekollektor.com')
      expect(@test_user.role).to match('user')
      expect(@test_user.encrypted_password).to match('')
    end

    it { expect(@test_user).to respond_to(:email, :role, :encrypted_password) }
  end
end
