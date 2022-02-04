class AddStreet2ToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :street2, :string
    remove_column :addresses, :stree1, :string
  end
end
