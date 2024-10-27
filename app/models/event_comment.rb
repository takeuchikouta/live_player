class EventComment < ApplicationRecord
  belongs_to :applicant
  belongs_to :event

  validates :comment, presence: true
end
