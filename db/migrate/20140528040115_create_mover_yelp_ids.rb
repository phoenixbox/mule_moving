class CreateMoverYelpIds < ActiveRecord::Migration
  def change
    create_table :mover_yelp_ids do |t|
      t.integer :mover_id, null: false
      t.string :yelp_id, null: false

      t.timestamps
    end

    add_index :mover_yelp_ids, [:mover_id, :yelp_id], unique: true
  end
end
