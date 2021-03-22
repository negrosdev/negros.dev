class Author < ApplicationRecord
  def avatar
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    "http://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
