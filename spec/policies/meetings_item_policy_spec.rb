RSpec.describe MeetingsItemPolicy, type: :policy do
  subject { MeetingsItemPolicy.new(user, record) }
  let(:item) { FactoryBot.create(:meetings_item) }

  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:destroy) }
  end
end
