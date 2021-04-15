class Category < ApplicationRecord
  has_one_attached :icon

  validates :name, :slug,   presence: true
  validates :slug,          uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :courses, dependent: :destroy
end
