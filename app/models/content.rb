class Content < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :body, :description, :slug, presence: true

  enum status: { draft: 0, published: 1, review: 2 }

  belongs_to :category
  has_many   :resources, dependent: :destroy
end
