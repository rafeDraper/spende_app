class CreateMeetingsLists < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings_lists do |t|
      t.string :title
      t.text :responsible

      t.timestamps
    end
  end
end
