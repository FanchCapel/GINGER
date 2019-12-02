require 'csv'
require 'faker'

CATEGORIES = ['Food', 'Sport', 'Cultural', 'Social', 'Educational']
CITIES = ["Lausanne", "Geneva", "Fribourg", "Sion", "Neuchatel"]
TIME_SLOTS = ["en aprem", "en soirée"]
BUDGETS = [150, 200, 250, 300, 350, 400, 450, 500]
PREF_LEVELS = [1, 2, 3]

# ---------------------- DELETE -----------------------------------

puts "Deleting experience slices..."
ExperienceSlice.destroy_all
puts "Done"
puts "Deleting activities..."
Activity.destroy_all
puts "Done"
puts "Deleting preferences categories..."
ExperiencePreferencesCategory.destroy_all
puts "Done"
puts "Deleting experiences..."
Experience.destroy_all
puts "Done"
puts "Deleting users..."
User.destroy_all
puts "Done"
puts "Deleting categories..."
Category.destroy_all
puts "Done"
puts "Deleting message types..."
MessageType.destroy_all
puts "Done"


# ---------------------- CREATE -----------------------------------

puts "Creating categories..."
CATEGORIES.each do |category|
  Category.create!(name: category)
end
puts "Done"

puts "Creating activities..."
file_path = File.dirname(__FILE__) + "/seeds.csv"
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

CSV.foreach(file_path, csv_options) do |row|
  activity = Activity.create!({
    name: row["Company name"],
    description: Faker::Lorem.paragraphs,
    meeting_point: Faker::Address.full_address,
    duration: Faker::Number.within(range: 6..12) * 10,
    city: CITIES.sample,
    price: Faker::Number.within(range: 5..15) * 10,
    category: Category.all.sample
  })
end
puts "Done"


puts "Creating users..."
User.create!(email:"alain.fresco@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0796666666',secondary_number: '0791234567', primary_first_name: "Alain", primary_last_name: "Fresco")
User.create!(email:"francois.capel@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0797777777',secondary_number: '0790987654', admin: true, primary_first_name: "Francois", primary_last_name: "Capel")
User.create!(email:"sinan.ucak@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0795555555',secondary_number: '0791234567', admin: true, primary_first_name: "Sinan", primary_last_name: "Ucak")
User.create!(email:"nathan.tempels@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0790000000',secondary_number: '0791234567', admin: true, primary_first_name: "Nathan", primary_last_name: "Tempels")
User.create!(email:"clara.leroux@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0791111111',secondary_number: '0791234567', primary_first_name: "Clara", primary_last_name: "Le Roux")
User.create!(email:"thibault.jaime@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0792222222',secondary_number: '0791234567', primary_first_name: "Thibault", primary_last_name: "Jaime")
User.create!(email:"nicholas.hendrickson@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0793333333',secondary_number: '0791234567', primary_first_name: "Nicholas", primary_last_name: "Hendrickson")
User.create!(email:"alessandro.bucarelli@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0794444444',secondary_number: '0791234567', primary_first_name: "Alessandro", primary_last_name: "Bucarelli")
User.create!(email:"cecile.colombo@gmail.com",password:"123456",password_confirmation:"123456", primary_number: '0798888888',secondary_number: '0791234567', primary_first_name: "Cecile", primary_last_name: "Colombo")
puts "Done"

puts "Creating experiences..."
30.times do
  Experience.create!(user: User.all.sample, city: CITIES.sample, date: Time.zone.today + Faker::Number.within(range: 10..30).day, time_slot: TIME_SLOTS.sample, budget_cents: BUDGETS.sample)
end
puts "Done"

puts "Creating experiences slices..."
15.times do
  experience = Experience.all.sample
  if experience.prepared_at.nil?
    activities = Activity.all.sample(3)
    ExperienceSlice.create!(experience: experience, activity: activities[0], order: 1)
    ExperienceSlice.create!(experience: experience, activity: activities[1], order: 2)
    ExperienceSlice.create!(experience: experience, activity: activities[2], order: 3)
    experience.update!(prepared_at: Time.zone.today + Faker::Number.within(range: 10..30).day)
    if [0, 1].sample === 1
      experience.update!(paid_at: Time.zone.today + Faker::Number.within(range: 10..30).day)
    end
  end
end
puts "Done"

puts "Creating experience preferences categories..."
15.times do
  experience = Experience.all.sample
  if experience.preference_level.nil?
    experience.preference_level = PREF_LEVELS.sample
    if experience.preference_level = 2
      [1, 2, 3].sample.times do
        ExperiencePreferencesCategory.create!(experience: experience, category: Category.all.sample)
      end
    end
  end
end
puts "Done"

puts "Creating message types..."
# Message 1
@messageType = MessageType.new
@messageType.message_type = "Day before"
@messageType.day = -1
@messageType.send_at = DateTime.parse('18:00:00')
@messageType.content = "'Bonjour! Je suis Ginger, votre majordome en charge de votre expérience que vous avez réservé ce' + message.experience.date.strftime(\'%d %m %y\') + '. Je vous donne donc rendez-vous demain à 18:30 à meeting . Ne pas oubliez pas de chager votre téléphone et de vous équiper en cas de pluie! A très bientôt pour de nouvelles instructions, Ginger.'"
@messageType.save!

# Message 2
@messageType = MessageType.new
@messageType.message_type = "Teasing1"
@messageType.day = 0
@messageType.send_at = DateTime.parse('12:00:00')
@messageType.content = 'message.experience.experience_slice.find_by_order(1).activity.teasing1'
@messageType.save!

# Message 3
@messageType = MessageType.new
@messageType.message_type = "Teasing2"
@messageType.day = 0
@messageType.send_at = DateTime.parse('15:00:00')
@messageType.content = 'message.experience.experience_slice.find_by_order(3).activity.teasing2'
@messageType.save!

# Message 4
@messageType = MessageType.new
@messageType.message_type = "Welcome"
@messageType.day = 0
@messageType.send_at = DateTime.parse('18:30:00')
@messageType.content = "'Bienvenue! Si Monsieur Dame veulent bien se donner la peine: ' + message.experience.experience_slice.find_by_order(1).activity.instruction"
@messageType.save!

# Message 5
@messageType = MessageType.new
@messageType.message_type = "End of exp 1"
@messageType.day = 0
@messageType.send_at = DateTime.parse('19:30:00')
@messageType.content = "'Prêts pour la suite?' + message.experience.experience_slice.find_by_order(2).activity.instruction}'"
@messageType.save!

# Message 6
@messageType = MessageType.new
@messageType.message_type = "End of exp 2"
@messageType.day = 0
@messageType.send_at = DateTime.parse('20:30:00')
@messageType.content = "'Ce n\'est pas fini!' + message.experience.experience_slice.find_by_order(3).activity.teasing1'"
@messageType.save!

# Message 7
@messageType = MessageType.new
@messageType.message_type = "End"
@messageType.day = 0
@messageType.send_at = DateTime.parse('21:00:00')
@messageType.content = 'Votre expérience touche à sa fin! Il est temps pour moi de vous souhaiter une bonne fin d\'expérience, en souhaitant vous revoir bientôt! Votre majordome, Ginger'
@messageType.save!
puts "Done"



