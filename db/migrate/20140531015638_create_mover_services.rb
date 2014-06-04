class CreateMoverServices < ActiveRecord::Migration
  def change
    create_table :mover_services do |t|
      t.integer :mover_id, null: false
      t.boolean :appliances_install
      t.boolean :appliances_uninstall
      t.boolean :auto_transport
      t.boolean :bulky_items
      t.boolean :cleaning
      t.boolean :crating
      t.boolean :electronics_packaging
      t.boolean :extra_stops
      t.boolean :furniture_assembly
      t.boolean :furniture_disassembly
      t.boolean :furniture_wrapping
      t.boolean :gun_safe
      t.boolean :packaging
      t.boolean :personal_truck_loading
      t.boolean :pianos
      t.boolean :shuttling
      t.boolean :storage

      t.timestamps
    end

    add_index :mover_services, :mover_id, unique: true
  end
end
