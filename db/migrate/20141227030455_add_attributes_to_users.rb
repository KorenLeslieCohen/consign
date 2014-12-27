class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url, :string
    add_column :users, :tagline, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
