class EventEntry < ApplicationRecord
  belongs_to :applicant
  belongs_to :event

  def self.entry?(event, current_applicant)
    find_by(event_id: event.id, applicant_id: current_applicant.id).present?
  end
end
