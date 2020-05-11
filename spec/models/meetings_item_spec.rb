RSpec.describe MeetingsItem, type: :model do
  let(:meetings_item) { build(:meetings_item) }

  describe 'associations' do
    it { should belong_to(:meetings_list) }
  end

  it 'is valid with valid attributes' do
    expect(meetings_item).to be_valid
  end

  it 'is not valid without a date' do
    meetings_item.date = nil
    expect(meetings_item).to_not be_valid
  end
  it 'is not valid without a reason' do
    meetings_item.reason = nil
    expect(meetings_item).to_not be_valid
  end
end
