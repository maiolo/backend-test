class CreatePayloads < ActiveRecord::Migration[6.0]
  def change
    create_table :payloads do |t|
      t.string :json_url

      t.timestamps
    end
  end
end
