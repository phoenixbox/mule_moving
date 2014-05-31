class CreateMoverOpeningHours < ActiveRecord::Migration
  def change
    create_table :mover_opening_hours do |t|
      t.integer :mover_id, null: false
      t.integer :day_of_week
      t.time :open
      t.time :close

      t.timestamps
    end

    add_index :mover_opening_hours, [:mover_id, :day_of_week], unique: true
  end
end
