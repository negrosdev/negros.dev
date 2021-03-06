class Content < ApplicationRecord
  has_one_attached :thumbnail

  enum status: { published: 1, draft: 2 }

  validates :title,
            :description,
            presence: true
  validates :title,
            uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to    :author
  belongs_to    :tag
  has_many      :tracks, -> { order(order: :asc) }, inverse_of: :content
end
