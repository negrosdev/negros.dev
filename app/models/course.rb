class Course < ApplicationRecord
  has_one_attached :source_code
  has_one_attached :course_download

  validates :title, :description, :level, :slug,   presence: true
  validates :title, :slug,                         uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author,         optional: false
  belongs_to :category,       optional: false
  belongs_to :album
end
