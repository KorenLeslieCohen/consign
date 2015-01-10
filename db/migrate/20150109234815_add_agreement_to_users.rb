class AddAgreementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :agree_to_terms, :string
  end
end
