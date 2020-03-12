
class AddMonetizeToMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :meetings_items, :income, currency: { present: false }
  end
end
