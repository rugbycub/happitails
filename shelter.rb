class Shelter
	attr_accessor :clients, :animals

	def initialize(clients = [], animals = [])
		@clients = clients
		@animals = animals
	end	

	def get_client_list
		result = @clients.inject("") do |contact_list, client|
			contact_list << "#{client.name}\n"
		end
		result
	end


end
