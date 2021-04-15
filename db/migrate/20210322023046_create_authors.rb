class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.string :facebook
      t.string :twitter
      t.string :youtube

      t.timestamps
    end
  end
end
