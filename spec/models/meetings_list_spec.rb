require 'rails_helper'

RSpec.describe MeetingsList, type: :model do
  describe 'associations' do
    it { should have_many(:meetings_item) }
  end

  subject { build(:meetings_list) }

  context 'valid list attributes' do
    it 'should be a valid list' do
      expect(subject).to be_valid
    end
  end
end
