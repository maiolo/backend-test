class DropCreateOrdersItems < ActiveRecord::Migration[6.0]
  def change
    drop_table :create_orders_items
  end
end
