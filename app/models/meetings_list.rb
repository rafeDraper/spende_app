# frozen_string_literal: true

class MeetingsList < ApplicationRecord
  has_many :meetings_items, dependent: :delete_all
end
