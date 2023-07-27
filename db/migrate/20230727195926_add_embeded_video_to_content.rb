class AddEmbededVideoToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :embeded_video, :text
  end
end
