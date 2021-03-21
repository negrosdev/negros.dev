class Course < ApplicationRecord
  belongs_to :album
  belongs_to :user
  belongs_to :source_code
  belongs_to :category
end
