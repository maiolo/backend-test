class ChangeDateToString < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :date_created, :string
    change_column :orders, :date_closed, :string
    change_column :orders, :last_updated, :string
    change_column :shippings, :date_created, :string
    change_column :payments, :date_created, :string
    change_column :payments, :date_approved, :string
  end
end
