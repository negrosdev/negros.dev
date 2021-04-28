class Course < ApplicationRecord
  has_one_attached :source_code
  has_one_attached :thumbnail

  validates :title, 
            :description, 
            :level, 
            :slug, 
            :vimeo_ref, presence: true
  validates :title, 
            :slug, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author
  belongs_to :category
end
