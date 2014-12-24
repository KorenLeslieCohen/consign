class AddGoodsReturnToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :return_of_consigned_goods, :text
  end
end
