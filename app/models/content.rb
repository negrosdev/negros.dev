class Content < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :body, :description, :slug, presence: true
end
