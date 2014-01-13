class Shelter
	attr_accessor :clients, :animals

	def initialize(clients = [], animals = [])
		@clients = clients
		@animals = animals
	end	

	def client_list
		result = @clients.inject("") do |client_list, client|
			client_list << "Name: #{client.name}\n"
		end
		result
	end

	def animal_list
		result = @animals.inject("") do |animal_list, animal|
			animal_list << "Name: #{animal.name} Species: #{animal.species} Age: #{animal.age}\n"
		end
		result
	end

end
