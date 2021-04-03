class Category < ApplicationRecord
  validates :name, :slug,   presence: true
  validates :slug,          uniqueness: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
