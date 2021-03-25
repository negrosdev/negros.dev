class RemoveFacebookFromAuthor < ActiveRecord::Migration[6.1]
  def change
    remove_column :authors, :facebook, :string
  end
end
