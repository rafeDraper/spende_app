# Meetings items class
class MeetingsItem < ApplicationRecord
  belongs_to :meetings_list

  def completed?
    !completed_at.blank?
  end
end
