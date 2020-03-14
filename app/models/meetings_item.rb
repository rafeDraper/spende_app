# Meetings items class
class MeetingsItem < ApplicationRecord
  belongs_to :meetings_list
  validates :reason, presence: { message: "must be given please" }

  def completed?
    !completed_at.blank?
  end
end
