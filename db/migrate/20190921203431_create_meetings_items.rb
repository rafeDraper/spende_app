# frozen_string_literal: true

# db
class CreateMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings_items do |t|
      t.string   :date
      t.string   :reason
      t.references :meetings_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
