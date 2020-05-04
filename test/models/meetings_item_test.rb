require 'test_helper'

class MeetingsItemTest < ActiveSupport::TestCase
  def setup
    @meetings_item = meetings_items(:one)
  end
  test 'valid meeting item' do
    assert @meetings_item.valid?
  end

  test 'monetize present by the item' do
  end

  test 'invalid without reason' do
    
    assert_not_nil @meetings_item.errors[:reason], 'no validation error for reason present'
  end

  test 'invalid without date' do
 
    assert_not_nil @meetings_item.errors[:date]
  end
end
