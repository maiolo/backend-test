class CreateBillingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :billing_infos do |t|
      t.references :buyer, null: false, foreign_key: true
      t.string :doc_type
      t.string :doc_number

      t.timestamps
    end
  end
end
