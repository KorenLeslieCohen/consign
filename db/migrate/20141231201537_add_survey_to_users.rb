class AddSurveyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :string
    add_column :users, :gender, :string
  end
end
