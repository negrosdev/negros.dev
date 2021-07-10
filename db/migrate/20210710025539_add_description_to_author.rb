class AddDescriptionToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :description, :string
  end
end
