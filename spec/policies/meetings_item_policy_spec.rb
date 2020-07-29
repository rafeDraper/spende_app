RSpec.describe MeetingsItemPolicy, type: :policy do
  subject { MeetingsItemPolicy.new(user, MeetingsItem) }
  let(:m_item) { FactoryBot.create(:meetings_item) }

  context 'being a visitor' do
    let(:user) { FactoryBot.create(:user) }
    it { is_expected.to forbid_actions(%i[show destroy update edit]) }
  end

  context 'being an administrator' do
    let(:user) { FactoryBot.create(:user, :admin) }

    it { is_expected.to permit_action(%i[destroy]) }
  end
end
