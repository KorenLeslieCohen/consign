class CreateBusinessBiztags < ActiveRecord::Migration
  def change
    create_table :business_biztags do |t|
      t.integer :business_id
      t.integer :biztag_id

      t.timestamps
    end
  end
end
