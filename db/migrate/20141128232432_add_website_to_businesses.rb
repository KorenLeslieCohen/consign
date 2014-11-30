class AddWebsiteToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :website, :string
  end
end
