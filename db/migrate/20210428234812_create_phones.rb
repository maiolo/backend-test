class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.references :buyer, null:false, foreign_key: true
      t.integer :area_code
      t.integer :number

      t.timestamps
    end
  end
end
