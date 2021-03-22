class Author < ApplicationRecord
  def avatar
    gravatar_id = Digest::MD5::hexdigest(eamil.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: name, class: 'is-rounded')
  end
end
