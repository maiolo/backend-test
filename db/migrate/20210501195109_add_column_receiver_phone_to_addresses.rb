class AddColumnReceiverPhoneToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :receiver_phone, :interger
  end
end
