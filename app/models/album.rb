class Album < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_one :course, dependent: :destroy
end
