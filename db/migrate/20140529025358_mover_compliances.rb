class MoverCompliances < ActiveRecord::Migration
  def change
    create_table :mover_compliances do |t|
      t.integer :mover_id, null: false
      t.string :general_liability_insurance

      t.timestamps
    end
  end
end