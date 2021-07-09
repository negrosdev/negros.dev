class RemoveContentDownloadUrlFromContent < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :content_download_url, :string
  end
end
