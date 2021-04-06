class AddAlbumToCourse < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :album, null: false, foreign_key: true
  end
end
