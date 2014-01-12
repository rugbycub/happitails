require './animal'
require './shelter'
require './client'

happitails = Shelter.new
puts `clear`

def menu_logo
	puts "____________________________________________________________________"
	puts "|                .  .               ,---.       .     	           |"               
	puts "|_     /)---(\\   |  |             o   |       o |      /\\___/\\     |"
	puts "|\\\\   (/ . . \\)  |--| ,-: ;-. ;-. .   |   ,-: . | ,-. |  . .  |    |"
	puts "| \\\\__)-\\(*)/    |  | | | | | | | |   |   | | | | `-. (__>^<__)    |"
	puts "| \\_       (_    '  ' `-` |-' |-' '   '   `-` ' ' `-'  (     )  /~ |"
	puts "| (___/-(____)            '   '                       (       )/   |"
	puts "|                     ADOPTION MANAGEMENT SYSTEM                   |"
	puts "|__________________________________________________________________|"
end


def menu message
	puts `clear`
	menu_logo
	puts "\n"
	puts "#{message}\n\n" unless message.empty?

	puts "1 - Create a New Client"
	puts "2 - Create a New Animal"
  puts "3 - Display All Client Records"
  puts "4 - Display All Animal Records"
	puts "5 - Facilitate an Adoption"
	puts "6 - Recieve Adoption from Client"
	puts "q - Quit \n\n"
	print " ------->"
	gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
	message = ""
		case choice
		when "1"
			message = "Create a New Client"
			puts "Please enter client's name"
			name = gets.chomp
			puts "Please enter client's age"
			age = gets.chomp
			puts "Pleae enter client's number of children"
			num_of_kids = gets.chomp
			puts "Please enter client's number of pets"
			num_of_pets = gets.chomp
			happitails.clients << Client.new(name, num_of_kids, age, num_of_pets)
			message += "New Client Created:\n Name: #{name} \n Age: #{age} \n Number of Children: #{num_of_kids} \n Number of Pets: #{num_of_pets}"

		when "2"
			message += "Option 2 - Create a New Animal"

		when "3"
			message = "Display All Client Records\n"
			message += happitails.get_client_list 
		when "4"
			message += "Option 4 - Display All Animal Records"

		when "5"
			message += "Option 5 - Facilitate an Adoption"

		when "6"
			message += "Option 6 - Recieve Adoption from Client"

		else
			message += "I don't understand"
		end

		choice = menu message
end


puts "Thank you for using the system.  Goodbye"

