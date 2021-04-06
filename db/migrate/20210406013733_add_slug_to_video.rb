class AddSlugToVideo < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :slug, :string
  end
end
