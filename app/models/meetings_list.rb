# frozen_string_literal: true

class MeetingsList < ApplicationRecord

  has_many :meetings_items
end
