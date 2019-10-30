class MeetingsItem < ApplicationRecord
  belongs_to :meetings_list
  validates :date, presence: true
  validates :reason, presence: true

  def completed?
    !completed_at.blank?
  end
end
