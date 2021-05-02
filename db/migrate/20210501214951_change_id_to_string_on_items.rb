class ChangeIdToStringOnItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :id, :string, null:false, primary_key: true
  end
end
