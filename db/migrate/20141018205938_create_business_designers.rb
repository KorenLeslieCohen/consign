class CreateBusinessDesigners < ActiveRecord::Migration
  def change
    create_table :business_designers do |t|
      t.integer :business_id
      t.integer :designer_id

      t.timestamps
    end
  end
end
