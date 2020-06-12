RSpec.describe MeetingsItem, type: :model do
  before(:each) do
    @item = create(:meetings_item)
  end

  describe 'associations' do
    it { should belong_to(:meetings_list) }
  end

  describe 'validations' do
    context 'valid attributes' do
      it 'is valid' do
        expect(@item).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'whithout date' do
        @item.date = nil
        expect(@item).to_not be_valid
      end

      it 'without reason' do
        @item.reason = nil
        expect(@item).to_not be_valid
      end
    end
  end

  describe '#completed?' do
    it 'completes an item' do
      @item.completed_at = Date.today
      expect(@item.completed?).to eq(true)
    end
  end
end
