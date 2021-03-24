class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged


  belongs_to :source_code
  belongs_to :author
  belongs_to :category
end
