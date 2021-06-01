class Author < ApplicationRecord
  has_one_attached :photo

  validates :name, :email,  presence: true
  validates :email,         uniqueness: true

  def email_url
    "mailto:#{email}"
  end

  def linkedin_url
    "https://www.linkedin.com/in/#{linkedin}"
  end
end
