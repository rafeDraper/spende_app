# frozen_string_literal: true

# Meetings items class
class MeetingsItem < ApplicationRecord
  belongs_to :meetings_list
  monetize :geld_collect_cents

  def completed?
    !completed_at.blank?
  end
end
