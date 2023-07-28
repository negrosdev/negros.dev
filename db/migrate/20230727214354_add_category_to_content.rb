class AddCategoryToContent < ActiveRecord::Migration[7.0]
  def change
    add_reference :contents, :category, null: false, foreign_key: true
  end
end
