class AddRoleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :role, :string
  end
end
