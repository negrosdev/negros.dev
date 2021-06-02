class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum color: { light: 1, primary: 2, warning: 3, rose: 4, info: 5, dark: 6 }

  has_many :contents, dependent: :restrict_with_error
end
