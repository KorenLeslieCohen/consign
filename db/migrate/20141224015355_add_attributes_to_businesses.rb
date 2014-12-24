class AddAttributesToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :percent_to_client, :text
    add_column :businesses, :markdown_info, :text
    add_column :businesses, :consignment_period, :text
    add_column :businesses, :return_policy, :text
    add_column :businesses, :appointment_info, :text
    add_column :businesses, :special_offers, :text
    add_column :businesses, :ecommerce_site, :string

    add_column :businesses, :city, :string
    add_column :businesses, :state, :string
    add_column :businesses, :zip, :string

    add_column :businesses, :sunday_opening, :string
    add_column :businesses, :sunday_closing, :string
    add_column :businesses, :monday_opening, :string
    add_column :businesses, :monday_closing, :string
    add_column :businesses, :tuesday_opening, :string
    add_column :businesses, :tuesday_closing, :string
    add_column :businesses, :wednesday_opening, :string
    add_column :businesses, :wednesday_closing, :string
    add_column :businesses, :thursday_opening, :string
    add_column :businesses, :thursday_closing, :string
    add_column :businesses, :friday_opening, :string
    add_column :businesses, :friday_closing, :string
    add_column :businesses, :saturday_opening, :string
    add_column :businesses, :saturday_closing, :string
  end
end
