class CreateMoverHeroes < ActiveRecord::Migration
  def change
    create_table :mover_heroes do |t|
      t.integer :mover_id, null: false
      t.string :image_url

      t.timestamps
    end

    add_index :mover_heroes, :mover_id, unique: true
  end
end
