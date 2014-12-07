class AddMapToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :map, :text
  end
end
