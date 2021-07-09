class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string    :name
      t.integer   :track_type
      t.text      :resource
      t.integer   :duration, default: 0
      t.string    :slug
      t.integer   :order
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
