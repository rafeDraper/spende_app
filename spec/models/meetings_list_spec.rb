RSpec.describe MeetingsList, type: :model do
  let(:test_list) { build(:meetings_list) }

  describe 'associations' do
    it { should have_many(:meetings_items) }
  end

  describe 'Meetings list created' do
    context 'list validation' do
      it 'validates the list' do
        expect(test_list).to be_valid
      end

      it 'validates to have a title' do
        test_list.title = nil
        expect(test_list).to_not be_valid
      end

      it 'validates to have a responsible' do
        test_list.responsible = nil
        expect(test_list).to_not be_valid
      end
    end
  end
end
