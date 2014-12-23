class AddAdminEmailToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :admin_email, :string
  end
end
