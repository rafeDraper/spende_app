class MeetingsList < ApplicationRecord
  has_many :meetings_items, dependent: :delete_all
  validates :title, presence: true
  validates :responsible, presence: true
end
