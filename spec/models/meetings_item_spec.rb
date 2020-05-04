require 'rails_helper'

RSpec.describe MeetingsItem, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.date = "2020-19-04"
    subject.reason = 'Spende'
    subject.meetings_list_id = 2
    subject.created_at = DateTime.now
    subject.completed_at = DateTime.now + 1.week
    subject.updated_at = DateTime.now + 1.hour
    subject.amount_cents = 21
    subject.amount_currency = 'EUR'
    expect(subject).to be_valid
  end
  it 'is not valid without a date' do
    item = MeetingsItem.new(date: nil)
    expect(item).to_not be_valid
  end
  it 'is not valid without a description'
  it 'is not valid without a start_date'
  it 'is not valid without a end_date'
end
