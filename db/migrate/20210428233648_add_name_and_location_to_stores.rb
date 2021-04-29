class AddNameAndLocationToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :name, :string
    add_column :stores, :location, :string
  end
end
