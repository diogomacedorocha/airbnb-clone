class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps
    end
  end
end
