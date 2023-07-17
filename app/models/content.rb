class Content < ApplicationRecord
  validates :name, :body, :description, :slug, presence: true
end
