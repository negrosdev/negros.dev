class RemoveCodeFromCourse < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :code, :string
  end
end
