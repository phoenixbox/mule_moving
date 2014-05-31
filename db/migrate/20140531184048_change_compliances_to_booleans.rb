class ChangeCompliancesToBooleans < ActiveRecord::Migration
  def change
    remove_column :mover_compliances, :cargo_insurance
    remove_column :mover_compliances, :automobile_insurance
    remove_column :mover_compliances, :workers_compensation
    remove_column :mover_compliances, :general_liability_insurance

    add_column :mover_compliances, :cargo_insurance, :boolean
    add_column :mover_compliances, :automobile_insurance, :boolean
    add_column :mover_compliances, :workers_compensation, :boolean
    add_column :mover_compliances, :general_liability_insurance, :boolean
  end
end
