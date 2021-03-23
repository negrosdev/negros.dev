class AddCodeToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :code, :string
  end
end
