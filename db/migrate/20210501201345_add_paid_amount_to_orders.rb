class AddPaidAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :paid_amount, :float
  end
end
