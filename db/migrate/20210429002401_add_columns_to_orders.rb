class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :store, null: false, foreign_key: true
    add_column :orders, :date_closed, :date
    add_column :orders, :total_amount, :float
    add_column :orders, :total_shipping, :float
    add_column :orders, :total_amount_with_shipping, :float
    add_column :orders, :expiration_date, :float
    add_column :orders, :status, :string
    add_reference :orders, :buyer, null: false, foreign_key: true
  end
end
