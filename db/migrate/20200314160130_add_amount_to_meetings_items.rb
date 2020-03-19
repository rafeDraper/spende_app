class AddAmountToMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :meetings_items, :amount,
                 numericality: {
                   greater_than_or_equal_to: 0,
                   less_than_or_equal_to: 10_000
                 }
  end
end
