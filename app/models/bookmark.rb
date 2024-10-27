class Bookmark < ApplicationRecord
  belongs_to :applicant
  belongs_to :event

  def self.bookmarked?(current_applicant, event_id)
    find_by(applicant_id: current_applicant.id, event_id: event_id.id).nil?
  end
end
