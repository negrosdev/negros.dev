class Resource < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :content
end
