class AddFacebookPhotoToUsers < ActiveRecord::Migration
  def change
      add_column :users, :facebook_profile_photo, :string
  end
end
