require 'rails_helper'

RSpec.describe MeetingsItem, type: :model do
  subject do
    described_class.new(
      meetings_list_id: 2,
      date: '2020-19-04',
      reason: 'spende',
      amount: 20,
      created_at: '2020-05-04 14:20:53',
      updated_at: '2020-05-04 15:20:53',
      completed_at: '2020-05-11 14:20:53',
      amount_cents: 21,
      amount_currency: 'EUR'
    )
  end

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
