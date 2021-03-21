class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.integer :level
      t.references :album, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :source_code, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
