class Applicant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :event_entries, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_one_attached :profile_image

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |applicant|
      applicant.password = SecureRandom.urlsafe_base64
      applicant.name = "応募者(ゲスト)"
      applicant.introduction = "ゲストのユーザーです。\n一部できることが制限されています。"
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
     profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォローユーザーの検索
  #   フォロー済みの場合、ユーザーデータを返す
  #   フォローしていない場合は、nilを返す
  def following?(current_applicant, follow_id)
    # Followから自分と対象のユーザーがANDになっているレコードを検索
    Follow.find_by(applicant_id: follow_id, follow_id: current_applicant.id)
  end

  # フォローしている一覧取得
  def followed(applicant)
    Follow.where(follow_id: applicant.id)
  end

  # フォローされている一覧取得
  def follower(current_applicant)
    Follow.where(applicant_id: current_applicant.id)
  end

  def active_for_authentication?
    super && is_active
  end
end
