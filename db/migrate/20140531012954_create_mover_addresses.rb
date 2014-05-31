class CreateMoverAddresses < ActiveRecord::Migration
  def change
    create_table :mover_addresses do |t|
      t.integer :mover_id, null: false
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end

    add_index :mover_addresses, :mover_id, unique: true
  end
end
