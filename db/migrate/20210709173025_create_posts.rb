class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :slug
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end

    add_index :posts, :title, unique: true
  end
end
