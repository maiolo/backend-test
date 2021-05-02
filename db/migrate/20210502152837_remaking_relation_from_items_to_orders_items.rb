class RemakingRelationFromItemsToOrdersItems < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :orders_items, :items
    remove_column :orders_items, :item_id

    add_column :orders_items, :item_id, :string
    add_foreign_key :orders_items, :items
  end
end
