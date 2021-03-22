class AddAuthorToCourse < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :author, null: false, foreign_key: true
  end
end
