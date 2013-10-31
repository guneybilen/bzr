class RemoveColumnFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :body
  end
end
