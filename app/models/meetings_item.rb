# frozen_string_literal: true

# Meetings items class
class MeetingsItem < ApplicationRecord
  belongs_to :meetings_list
  # validates :date, presence: true
  # validates :reason, presence: true
  monetize :dinero_cents
  def completed?
    !completed_at.blank?
  end
end
