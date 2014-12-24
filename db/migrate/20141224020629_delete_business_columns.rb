class DeleteBusinessColumns < ActiveRecord::Migration
  def change
    remove_column :businesses, :hours
    remove_column :businesses, :terms
  end
end
