require 'rails_helper'
require 'factories/meetings_item'

RSpec.describe MeetingsItem, type: :model do
  describe 'associations' do
    it { should belong_to(:meetings_list) }
  end

  subject { build(:meetings_item) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a reason' do
    subject.reason = nil
    expect(subject).to_not be_valid
  end
end
