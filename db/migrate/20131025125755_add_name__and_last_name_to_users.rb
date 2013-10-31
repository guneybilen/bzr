class AddNameAndLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :limit => 100
    add_column :users, :last_name, :string, :limit => 100
  end
end
