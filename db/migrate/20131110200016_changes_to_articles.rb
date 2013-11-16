class ChangesToArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :location, :city
    add_column :articles, :country, :string
    add_column :articles, :phone, :string
    add_column :articles, :cell, :string
  end
end
