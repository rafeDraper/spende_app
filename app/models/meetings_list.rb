# frozen_string_literal: true

class MeetingsList < ApplicationRecord
  validates_presence_of :title, :responsible
  has_many :meetings_items, dependent: :delete_all
end
