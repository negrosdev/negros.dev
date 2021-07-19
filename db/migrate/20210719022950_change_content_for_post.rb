class ChangeContentForPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :content, :text
  end
end
