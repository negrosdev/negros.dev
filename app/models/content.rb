class Content < ApplicationRecord
  has_one_attached :source_code
  has_one_attached :content_download

  validates :title,
            :description,
            :level,
            :slug,
            :content, presence: true
  validates :title,
            :slug,    uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to    :author
  belongs_to    :tag
end
