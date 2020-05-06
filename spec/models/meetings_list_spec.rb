require 'rails_helper'

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
    end
  end
end
