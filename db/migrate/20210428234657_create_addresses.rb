class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_line
      t.string :street_name
      t.integer :number
      t.string :comment
      t.string :zip_code
      t.string :city
      t.string :country_id
      t.string :country_name
      t.string :neighborhood
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
