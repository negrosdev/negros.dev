class AddGithubToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :github, :string
  end
end
