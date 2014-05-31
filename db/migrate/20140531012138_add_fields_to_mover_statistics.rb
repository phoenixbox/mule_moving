class AddFieldsToMoverStatistics < ActiveRecord::Migration
  def change
    add_column :mover_statistics, :trucks, :integer
  end

  add_index :mover_statistics, :mover_id, unique: true
end
