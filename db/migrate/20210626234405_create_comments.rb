class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :discord_id
      t.string :body
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
