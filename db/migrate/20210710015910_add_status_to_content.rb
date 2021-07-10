class AddStatusToContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :status, :integer, default: 2
  end
end
