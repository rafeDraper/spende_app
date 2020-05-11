RSpec.describe MeetingsList, type: :model do
  let(:meetings_list) { build(:meetings_list) }

  describe 'associations' do
    it { should have_many(:meetings_items) }
  end

  describe 'Meetings list created' do
    context 'list validation' do
      it 'validates the list' do
        expect(meetings_list).to be_valid
      end

      it 'validates to have a title' do
        meetings_list.title = nil
        expect(meetings_list).to_not be_valid
      end

      it 'validates to have a responsible' do
        meetings_list.responsible = nil
        expect(meetings_list).to_not be_valid
      end
    end
  end
end
