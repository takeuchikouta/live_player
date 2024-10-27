class Organizer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :events, dependent: :destroy

  has_one_attached :organizer_avatar

  def get_organizer_avatar(width, height)
    unless organizer_avatar.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
      organizer_avatar.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
     organizer_avatar.variant(resize_to_limit: [width, height]).processed
  end

  def active_for_authentication?
    super && is_active
  end
end
