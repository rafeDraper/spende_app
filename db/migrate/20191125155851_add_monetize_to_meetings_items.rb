# frozen_string_literal: true

class AddMonetizeToMeetingsItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :meetings_items, :geld_collect, amount: { null: true, default: nil }
  end
end
