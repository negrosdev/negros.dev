class Course < ApplicationRecord
  validates :title, :description, :level, :code,   presence: true
  validates :title, :slug,                         uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :source_code,    optional: false
  belongs_to :author,         optional: false
  belongs_to :category,       optional: false
end
