class CreateMoverServices < ActiveRecord::Migration
  def change
    create_table :mover_services do |t|
      t.integer :mover_id, null: false
      t.boolean :appliances_install, default: false
      t.boolean :appliances_uninstall, default: false
      t.boolean :auto_transport, default: false
      t.boolean :bulky_items, default: false
      t.boolean :cleaning, default: false
      t.boolean :crating, default: false
      t.boolean :electronics_packaging, default: false
      t.boolean :extra_stops, default: false
      t.boolean :furniture_assembly, default: false
      t.boolean :furniture_disassembly, default: false
      t.boolean :furniture_wrapping, default: false
      t.boolean :gun_safe, default: false
      t.boolean :packaging, default: false
      t.boolean :personal_truck_loading, default: false
      t.boolean :pianos, default: false
      t.boolean :shuttling, default: false
      t.boolean :storage, default: false

      t.timestamps
    end

    add_index :mover_services, :mover_id, unique: true
  end
end
