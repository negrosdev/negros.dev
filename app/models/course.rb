class Course < ApplicationRecord
  belongs_to :source_code
  belongs_to :author
  belongs_to :category
end
