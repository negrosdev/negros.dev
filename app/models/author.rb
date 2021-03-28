class Author < ApplicationRecord
  validates :name, :email,  presence: true
  validates :email,         uniqueness: true

  def avatar
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end

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
