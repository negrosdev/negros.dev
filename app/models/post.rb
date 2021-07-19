class Post < ApplicationRecord
  has_one_attached :image

  validates :title, :content, presence: true
  validates :title, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author
  belongs_to :tag
end
