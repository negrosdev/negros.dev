class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :order
      t.string :vimeo_code
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
