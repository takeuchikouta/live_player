class Event < ApplicationRecord
  has_many :event_comments, dependent: :destroy
  has_many :event_entries, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  belongs_to :organizer

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/organizer-event-image.png')
      image.attach(io: File.open(file_path), filename: 'organizer-event-image.png', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
