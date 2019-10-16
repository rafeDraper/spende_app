class MeetingsItem < ApplicationRecord
  belongs_to :meetings_list
  validates :amount, presence: true
  validates :date, presence: true
  validates :reason, presence: true
  validates :con_change, presence: true

  def completed?
    !completed_at.blank?
  end
end
