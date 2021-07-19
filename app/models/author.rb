class Author < ApplicationRecord
  has_one_attached :photo

  validates :name,          presence: true
  validates :email,         uniqueness: true

  def mail_url
    "mailto:#{email}"
  end

  def linkedin_url
    "https://www.linkedin.com/in/#{linkedin}"
  end

  def instagram_url
    "https://www.instagram.com/#{instagram}"
  end

  def facebook_url
    "https://www.facebook.com/#{facebook}"
  end

  def twitter_url
    "https://www.twitter.com/#{twitter}"
  end

  def github_url
    "https://www.github.com/#{github}"
  end
end
