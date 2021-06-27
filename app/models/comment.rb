class Comment < ApplicationRecord
  validates :discord_id, :body, presence: true
  
  belongs_to :content
end
