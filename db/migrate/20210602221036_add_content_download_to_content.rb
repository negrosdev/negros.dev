class AddContentDownloadToContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :content_download_url, :string
  end
end
