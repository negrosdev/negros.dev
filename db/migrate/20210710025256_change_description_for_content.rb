class ChangeDescriptionForContent < ActiveRecord::Migration[6.1]
  def change
    change_column :contents, :description, :text
  end
end
