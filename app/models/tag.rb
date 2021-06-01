class Tag < ApplicationRecord
  has_one_attached :icon

  validates :name, presence: true, uniqueness: true

  has_many :contents, dependent: :restrict_with_error
end
