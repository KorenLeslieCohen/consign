class ChangeBusinessAttributeNames < ActiveRecord::Migration
  def change
    rename_column :businesses, :address, :street_address
  end
end
