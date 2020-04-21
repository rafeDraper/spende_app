class AddCompletedAtMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings_items, :completed_at, :datetime
  end
end
