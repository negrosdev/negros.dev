class Track < ApplicationRecord
  has_one_attached :sources

  validates :name, :track_type, :duration, :order, presence: true

  enum track_type: { 'video': 1, 'text': 2, 'code': 3 }

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :content

  def set_track_type
    return 'video-camera' if video?
    return 'code' if code?

    'file-text'
  end
end
