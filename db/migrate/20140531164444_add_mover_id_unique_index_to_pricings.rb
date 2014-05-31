class AddMoverIdUniqueIndexToPricings < ActiveRecord::Migration
  def change
    add_index :mover_pricings, :mover_id, unique: true
  end
end
