class CreateMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings_items do |t|
      t.string :date
      t.float :amount, :decimal, precision: 8, scale: 2
      t.string :con_change
      t.string :reason
      t.references :meetings_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
