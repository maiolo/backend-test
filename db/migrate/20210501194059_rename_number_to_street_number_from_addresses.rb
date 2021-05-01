class RenameNumberToStreetNumberFromAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :number, :street_number
  end
end
