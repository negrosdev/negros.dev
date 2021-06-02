class Content < ApplicationRecord
  has_one_attached :source_code

  validates :title,
            :description,
            :level,
            :slug,
            :content_download_url,
            :content, presence: true
  validates :title,
            :content_download_url,
            :slug, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to    :author
  belongs_to    :tag
end
