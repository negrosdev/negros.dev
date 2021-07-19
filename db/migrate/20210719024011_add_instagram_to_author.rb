class AddInstagramToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :instagram, :string
  end
end
