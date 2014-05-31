class AddFieldsToMoverCompliances < ActiveRecord::Migration
  def change
    add_column :mover_compliances, :automobile_insurance, :string
    add_column :mover_compliances, :cargo_insurance, :string
    add_column :mover_compliances, :workers_compensation, :string
  end

  add_index :mover_compliances, :mover_id, unique: true
end
