class Content < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :body, :description, :slug, presence: true

  enum status: {draft: 0, publish: 1, review: 2}
end
