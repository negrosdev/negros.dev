class AddRolesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :roles, :integer, default: 0
  end
end
