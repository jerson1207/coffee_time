class AddTypeToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :type, :string
  end
end
