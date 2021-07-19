class AddTagToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :tag, null: true, foreign_key: true
  end
end
