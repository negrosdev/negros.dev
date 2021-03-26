class AddLinkedinToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :linkedin, :string
  end
end
