class Album < ApplicationRecord
  has_many :videos
  has_one :course
end
