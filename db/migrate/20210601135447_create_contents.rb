class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.text :content
      t.integer :level
      t.references :tag, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end

    add_index :contents, :title, unique: true
    add_index :contents, :slug, unique: true
  end
end
