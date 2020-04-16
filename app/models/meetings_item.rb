# Meetings items class
class MeetingsItem < ApplicationRecord
  validates :date, :reason, presence: true

  belongs_to :meetings_list
  monetize :amount_cents, allow_nil: true, default: nil
  def completed?
    !completed_at.blank?
  end
end
