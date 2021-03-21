class AddLastNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
  end
end
