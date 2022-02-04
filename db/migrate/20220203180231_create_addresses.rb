class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :stree1
      t.string :street1
      t.string :city
      t.string :province
      t.string :zip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
