class RenameColumnInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :excerpt, :body
  end
end
