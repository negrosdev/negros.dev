class Video < ApplicationRecord
  belongs_to :album

  extend FriendlyId
  friendly_id :name, use: :slugged
end
