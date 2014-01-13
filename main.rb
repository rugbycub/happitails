require './animal'
require './shelter'
require './client'
require 'pry'

happitails = Shelter.new
puts `clear`

def enter_to_continue
	puts "Press Enter to Continue"
	enter = gets.chomp
end

def menu_logo
	puts `clear`
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

def add_client (shelter, message = "")
	print "Please enter client's name              :  "
	name = gets.chomp
	print "Please enter client's age               :  "
	age = gets.chomp
	print "Pleae enter client's number of children :  "
	num_of_kids = gets.chomp
	print "Please enter client's number of pets    :  "
	num_of_pets = gets.chomp
	shelter.clients << Client.new(name: name, num_of_kids: num_of_kids, age: age, num_of_pets: num_of_pets.to_i)
	message += "New Client Created:\n Name               : #{name} \n Age               : #{age} \n Number of Children : #{num_of_kids} \n Number of Pets     : #{num_of_pets}"
	message
end


def add_animal(shelter, message = "")
	print "Please Enter Animal's name    :  "
	name = gets.chomp
	print "Please enter animal's age     :  "
	age = gets.chomp
	print "Please enter animal's gender  :  "
	gender = gets.chomp
	print "Please enter animal's species :  "
	species = gets.chomp
	shelter.animals << Animal.new(:name => name, :age => age, :gender => gender, :species => species)
	message = "Animal Added:\n Name    : #{name} \n Age     : #{age} \n Gender  : #{gender} \n Species : #{species}"
	message
end

def menu message
	menu_logo
	puts "\n#{message}\n\n" unless message.empty?

	puts "1 - Create a New Client"
	puts "2 - Create a New Animal"
  puts "3 - Display All Client Records"
  puts "4 - Display All Animal Records"
	puts "5 - Facilitate an Adoption"
	puts "6 - Accept an Animal from Client"
	puts "q - Quit \n\n"
	print "\n Please make selection: "; gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
	message = ""
	case choice
	

	when "1"
		menu_logo
		puts "Create a New Client\n"
		message += add_client happitails

	
	when "2"
		menu_logo
		puts "Create a New Animal\n"
		message += add_animal happitails
	
	when "3"
		message = "Display All Client Records\n"
		if happitails.clients.empty?
			message += "\nNo Clients Found"
		else
			message += happitails.client_list 
		end
	

	when "4"
		message = "Display All Animal Records\n"
		if happitails.animals.empty?
			message += "\nNo Clients Found"
		else
			message += happitails.animal_list
		end


	when "5"
		message = "Facilitate an Adoption" 
		puts `clear`
		menu_logo
		puts "Facilitate an Adoption"
		puts "Select animal"
		if happitails.animal_list.empty?
			puts "\nNo Animals Found!\n\n"
			puts "enter a to add or b to go back"
		else
			puts happitails.animal_list
			puts "enter full animal name, b for back, or a to add"
		end
		print "\n Please make selection: "; requested_animal = gets.chomp
		menu = ""
		while requested_animal != "b"
			if requested_animal == "a"
				menu_logo
				puts "Please Add Animal" 
				add_animal happitails
				message = "Return to Facilitate Adoption menu (option 5) \nto complete transaction"
				requested_animal = "b"
			else
				menu_logo
				selected_animal = (happitails.animals.select {|animal| animal.name == requested_animal}).first
				menu_logo
				puts "Please Enter Full Name of Client Adopting Animal. \nClient MUST Already be in System."
				puts "If Client is NOT in System, Please Press B to Return To Main Menu"
				puts happitails.client_list
				print "\n Please make selection: "; requested_client = gets.chomp
				while requested_animal != "b"	
					selected_client = (happitails.clients.select {|client| client.name == requested_client}).first
					selected_client.num_of_pets += 1
					puts "Client now has #{selected_client.num_of_pets} Pets"
					happitails.animals.delete(selected_animal)
					puts "#{requested_animal} has been adopted by #{requested_client}"
					requested_animal = "b"
				end
				message += "Adoption Successful"
				enter_to_continue
				requested_client = "b"
			end
		end

	
	when "6"
		puts `clear`
		menu_logo
		puts "Recieve Adoption from Client"
		puts "Select Client"
		puts happitails.client_list
		puts "enter full client name, b to go back, or a to add"
		print "\n Please Make Selection: ";	requested_client = gets.chomp
		menu = ""	

		while requested_client != "b"
		
			if requested_client == "a"
				menu_logo
				puts "Please add client" 
				add_client happitails
				message += "Return to Recieve Adoption menu (option 6) to complete transaction"
				requested_client = "b"
		
			else
				menu_logo
				selected_client = (happitails.clients.select {|client| client.name == requested_client}).first
				puts selected_client.num_of_pets
				selected_client.num_of_pets -= 1
				puts "Client now has #{selected_client.num_of_pets} pets"
				add_animal happitails
				message += "Animal Acceptance Successful"
				enter_to_continue
				requested_client = "b"
		
			end
		
		end

	else
	
		message += "Invalid Option.  Please try again"
	
	end

	choice = menu message

end
puts `clear`

menu_logo

puts "\n\nThank you for using the system.  Goodbye\n\n\n\n\n\n\n\n\n\n"

