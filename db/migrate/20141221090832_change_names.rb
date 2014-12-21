class ChangeNames < ActiveRecord::Migration
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :user_name, :last_name
  end
end
