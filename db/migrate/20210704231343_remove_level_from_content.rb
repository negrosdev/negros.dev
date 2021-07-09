class RemoveLevelFromContent < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :level, :integer
  end
end
