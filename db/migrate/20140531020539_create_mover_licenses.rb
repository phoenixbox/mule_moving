class CreateMoverLicenses < ActiveRecord::Migration
  def change
    create_table :mover_licenses do |t|
      t.integer :mover_id, null: false
      t.string :company_registration
      t.string :puc
      t.string :state_dot
      t.string :us_dot

      t.timestamps
    end

    add_index :mover_licenses, :mover_id, unique: true
  end
end
