class AddVideoCodeToVideo < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :video_code, :string
  end
end
