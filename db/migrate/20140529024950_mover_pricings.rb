class MoverPricings < ActiveRecord::Migration
  def change
    create_table :mover_pricings do |t|
      t.integer :mover_id, null: false
      t.integer :avg_price_per_hour

      t.timestamps
    end
  end
end
