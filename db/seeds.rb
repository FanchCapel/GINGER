require 'csv'
require 'faker'

CATEGORIES = ['Food', 'Sport', 'Cultural', 'Social', 'Educational']

puts "Deleting activities..."
Experience.destroy_all
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

puts "Creating categories"

CATEGORIES.each do |category|
  Category.create!(name: category)
end

User.create(email:"alain.fresco@gmail.com",password:"123456",password_confirmation:"123456",primary_number: '0796103643',secondary_number: '0791234567')

 Experience.new(user:User.first,city:"Lausanne",date: Time.zone.today + 2.day,time_slot:"en soirée")

# Message 1
@messageType = MessageType.new
@messageType.message_type = "Day before"
@messageType.day = -1
@messageType.send_at = DateTime.parse('18:00:00')
@messageType.content = "'Bonjour! Je suis Ginger, votre majordome en charge de votre expérience que vous avez réservé ce' + message.experience.date.strftime(\'%d %m %y\') + '. Je vous donne donc rendez-vous demain à 18:30 à meeting . Ne pas oubliez pas de chager votre téléphone et de vous équiper en cas de pluie! A très bientôt pour de nouvelles instructions, Ginger.'"
@messageType.save

# Message 2
@messageType = MessageType.new
@messageType.message_type = "Teasing1"
@messageType.day = 0
@messageType.send_at = DateTime.parse('12:00:00')
@messageType.content = 'message.experience.experience_slice.find_by_order(1).activity.teasing1'
@messageType.save

# Message 3
@messageType = MessageType.new
@messageType.message_type = "Teasing2"
@messageType.day = 0
@messageType.send_at = DateTime.parse('15:00:00')
@messageType.content = 'message.experience.experience_slice.find_by_order(3).activity.teasing2'
@messageType.save

# Message 4
@messageType = MessageType.new
@messageType.message_type = "Welcome"
@messageType.day = 0
@messageType.send_at = DateTime.parse('18:30:00')
@messageType.content = "'Bienvenue! Si Monsieur Dame veulent bien se donner la peine: ' + message.experience.experience_slice.find_by_order(1).activity.instruction"
@messageType.save

# Message 5
@messageType = MessageType.new
@messageType.message_type = "End of exp 1"
@messageType.day = 0
@messageType.send_at = DateTime.parse('19:30:00')
@messageType.content = "'Prêts pour la suite?' + message.experience.experience_slice.find_by_order(2).activity.instruction}'"
@messageType.save

# Message 6
@messageType = MessageType.new
@messageType.message_type = "End of exp 2"
@messageType.day = 0
@messageType.send_at = DateTime.parse('20:30:00')
@messageType.content = "'Ce n\'est pas fini!' + message.experience.experience_slice.find_by_order(3).activity.teasing1'"
@messageType.save

# Message 7
@messageType = MessageType.new
@messageType.message_type = "End"
@messageType.day = 0
@messageType.send_at = DateTime.parse('21:00:00')
@messageType.content = 'Votre expérience touche à sa fin! Il est temps pour moi de vous souhaiter une bonne fin d\'expérience, en souhaitant vous revoir bientôt! Votre majordome, Ginger'
@messageType.save



