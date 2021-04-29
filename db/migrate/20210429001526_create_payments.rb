class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.integer :installments
      t.string :payment_type
      t.string :status
      t.float :transaction_amount
      t.float :taxes_amount
      t.float :shipping_cost
      t.float :total_paid_amount
      t.float :installment_amount
      t.date :date_approved

      t.timestamps
    end
  end
end
