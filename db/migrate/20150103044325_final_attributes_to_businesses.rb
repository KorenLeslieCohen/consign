class FinalAttributesToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :store_bio, :text
    add_column :businesses, :authenticity, :string
    add_column :businesses, :shop_additional_info, :text
  end
end
