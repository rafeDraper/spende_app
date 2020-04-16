# frozen_string_literal: true

require 'test_helper'

class MeetingsItemTest < ActiveSupport::TestCase
  def setup
    @item = MeetingsItem.new(date: '11.11.2020',
                             reason: 'example_reason',
                             amount: 12)
  end

  test 'should be valid' do
    assert @item.valid?
  end
end
