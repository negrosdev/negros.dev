class Course < ApplicationRecord
  validates :title, :description, :level, :code, :slug,   presence: true
  validates :title, :slug, :code,                         uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :source_code,    optional: false

  belongs_to :author,         optional: false
  belongs_to :category,       optional: false
end
