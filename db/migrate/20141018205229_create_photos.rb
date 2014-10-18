class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :business_id
      t.integer :user_id
      t.attachment :business_photo
      t.text :description

      t.timestamps
    end
  end
end
