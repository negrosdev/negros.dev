class AddTwitterToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :twitter, :string
  end
end
