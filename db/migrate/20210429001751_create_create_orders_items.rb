class CreateCreateOrdersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :create_orders_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.float :full_unit_price

      t.timestamps
    end
  end
end
