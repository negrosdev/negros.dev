class RemoveUserFromCourse < ActiveRecord::Migration[6.1]
  def change
    remove_reference :courses, :user, null: false, foreign_key: true
  end
end
