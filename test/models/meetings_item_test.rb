# frozen_string_literal: true

require 'test_helper'

class MeetingsItemTest < ActiveSupport::TestCase
  def setup
    @item = MeetingsItem.new(date: '11.11.2020',
                             reason: 'example_reason',
                             amount_cents: 22)
  end

  test 'saving item should be valid' do
    assert_not @item.valid?
  end
end
