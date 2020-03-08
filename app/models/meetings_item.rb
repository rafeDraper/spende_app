# frozen_string_literal: true

# Meetings items class
class MeetingsItem < ApplicationRecord

  belongs_to :meetings_list
  monetize :income_cents

  def completed?
    !completed_at.blank?
  end
end
