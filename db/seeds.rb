require 'csv'
require 'faker'


puts "Deleting activities..."
Activity.destroy_all
puts "Re creating activities..."

file = File.dirname(__FILE__)

file_path = file + "/seeds.csv"
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

CSV.foreach(file_path, csv_options) do |row|
  activity = Activity.new({
    name: row["Company name"],
    description: Faker::Lorem.paragraphs,
    meeting_point: Faker::Address.full_address,
    duration: Faker::Number.within(range: 6..12) * 10,
    city: ["Lausanne", "Geneva", "Fribourg", "Sion", "Neuchatel"].sample,
    price: Faker::Number.within(range: 5..15) * 10
  })
  activity.save!
end

puts "Done..."
