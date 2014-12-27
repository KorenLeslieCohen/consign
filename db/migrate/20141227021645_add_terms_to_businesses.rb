class AddTermsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :pickup_available, :string
    add_column :businesses, :restrictions, :text
    add_column :businesses, :additional_info, :text
  end
end
