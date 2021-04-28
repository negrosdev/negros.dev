class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title, index: { unique: true }
      t.string :slug, index: { unique: true }
      t.string :description
      t.string :vimeo_ref
      t.integer :level
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
