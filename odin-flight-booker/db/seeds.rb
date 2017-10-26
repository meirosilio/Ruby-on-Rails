# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = { 'LAX' => 'Los Angelos',
             'LHR' => 'London',
             'SFO' => 'San Francisco',
             'ATL' => 'Atlanta',
             'LAS' => 'Las Vegas',
             'ORD' => 'Chicago',
             'AMS' => 'Amsterdam' }

# Create airports
airports.each_pair do |code, location|
  Airport.create(iata_code: code, location: location)
end


# 10 departure dates in the future
dept_dates = []
10.times do
  dept_dates << Faker::Date.forward(30)
end


# Create flights for every airport

# Origin airports
airports.each_with_index do |orig_ap, orig_i|
  origin_airport_id = orig_i + 1 # Start ID at 1, not 0

  # Destination airports
  airports.each_with_index do |dest_ap, dest_i|
    next if orig_ap == dest_ap # Skip if airports are the same
    destination_airport_id = dest_i + 1 # Start ID at 1, not 0

    # Departure dates
    dept_dates.each do |date|

      # Create 7 flights for each day
      7.times do
        Flight.create(origin_airport_id: origin_airport_id,
                      destination_airport_id: destination_airport_id,
                      duration: rand(60..600),
                      departure_date: Faker::Time.between(date.beginning_of_day, date.end_of_day))
      end
    end
  end
end
