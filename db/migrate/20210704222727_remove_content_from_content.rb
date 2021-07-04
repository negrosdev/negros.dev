class RemoveContentFromContent < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :content, :text
  end
end
