class AddDateCreatedColumnsToShippingsOrdersPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :shippings, :date_created, :date
    add_column :orders, :date_created, :date
    add_column :orders, :last_updated, :date
    add_column :payments, :date_created, :date
  end
end
