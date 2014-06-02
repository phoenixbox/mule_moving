class CreateBookings < ActiveRecord::Migration
  def change
    create_table :booking_records do |t|
      t.integer :mover_id
      t.string :email
      t.string :from
      t.string :to
      t.date :move_date

      t.timestamps
    end
  end
end
