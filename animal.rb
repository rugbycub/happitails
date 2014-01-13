class Animal
	attr_accessor :name, :age, :gender, :species, :toys

  def initialize(animal_parameters = {})
		@name = animal_parameters.fetch(:name, "") 
		@age = animal_parameters.fetch(:age, "")
		@gender = animal_parameters.fetch(:gender, "")
		@species = animal_parameters.fetch(:species, "")
		@toys = animal_parameters.fetch(:toys, [])
	end	

	

end