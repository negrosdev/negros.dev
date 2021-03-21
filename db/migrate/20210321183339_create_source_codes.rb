class CreateSourceCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :source_codes do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
