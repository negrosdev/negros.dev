class Course < ApplicationRecord
  has_one_attached :source_code

  validates :title, :description, :level, :slug,   presence: true
  validates :title, :slug,                         uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author
  belongs_to :category
  belongs_to :album, optional: true
end
