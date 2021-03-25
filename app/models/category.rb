class Category < ApplicationRecord
  validates :name,    presence: true
  validates :slug,    uniqueness: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
