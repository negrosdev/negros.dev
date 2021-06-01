class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    add_index :tags, :name, unique: true
  end
end
