class AddFacebookToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :facebook, :string
  end
end
