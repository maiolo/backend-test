class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :order, null: false, foreign_key: true
      t.string :shipment_type
      t.references :address, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
