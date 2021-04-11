class Author < ApplicationRecord
  has_one_attached :photo

  validates :name, :email,  presence: true
  validates :email,         uniqueness: true

  def twitter_url
    "https://twitter.com/#{twitter}"
  end

  def youtube_url
    "https://instagram.com/channel/#{youtube}"
  end

  def instagram_url
    "https://instagram.com/#{instagram}"
  end

  def linkedin_url
    "https://www.linkedin.com/in/#{linkedin}"
  end

end
