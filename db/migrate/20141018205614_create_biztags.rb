class CreateBiztags < ActiveRecord::Migration
  def change
    create_table :biztags do |t|
      t.string :name

      t.timestamps
    end
  end
end
