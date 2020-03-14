class AddAmountToMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings_items, :amount, :decimal, precision: 8, scale: 2
  end
end
