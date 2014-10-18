class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.integer :neighborhood_id
      t.integer :borough_id
      t.string :name
      t.text :address
      t.text :hours
      t.string :email
      t.text :terms

      t.attachment :profile_photo

      t.timestamps
    end
  end

end
