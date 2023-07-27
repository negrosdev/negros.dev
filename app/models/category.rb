class Category < ApplicationRecord
  validates :name, :color, presence: true

  has_many :contents, dependent: :destroy
end
