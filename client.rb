class Client
	attr_accessor :name, :num_of_kids, :age, :num_of_pets
	
	def initialize(client_parameters = {})
			@name = client_parameters.fetch(:name, "")
			@num_of_kids = client_parameters.fetch(:num_of_kids, "")
			@age = client_parameters.fetch(:age, "")
			@num_of_pets = client_parameters.fetch(:num_of_pets, "")
	end

end