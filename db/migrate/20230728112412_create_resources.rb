class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
