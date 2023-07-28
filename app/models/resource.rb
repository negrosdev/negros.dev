class Resource < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :content
end
