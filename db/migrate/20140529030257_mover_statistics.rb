class MoverStatistics < ActiveRecord::Migration
  def change
    create_table :mover_statistics do |t|
      t.integer :mover_id, null: false
      t.integer :employees
      t.integer :year_started

      t.timestamps
    end
  end
end
