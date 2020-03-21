# Meetings items class
class MeetingsItem < ApplicationRecord
  include InputHelper
  belongs_to :meetings_list
  monetize :amount_cents, allow_nil: true
  def completed?
    !completed_at.blank?
  end
end
