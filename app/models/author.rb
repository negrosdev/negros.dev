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
end
