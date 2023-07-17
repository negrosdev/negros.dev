class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :slug, index: { unique: true }
      t.string :body
      t.string :description
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :contents, :name
  end
end
