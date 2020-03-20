# frozen_string_literal: true

class AddAmountToMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :meetings_items, :amount, allow_nil: true,
                                           numericality: {
                                             greater_than_or_equal_to: 0,
                                             less_than_or_equal_to: 10_000
                                           }
  end
end
