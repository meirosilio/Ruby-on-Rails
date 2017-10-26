class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :origin_airport_id
      t.integer :destination_airport_id
      t.datetime :departure_date
      t.integer :duration

      t.timestamps
    end
  end
end
