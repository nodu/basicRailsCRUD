class Person
	include Mongoid::Document  # provides persistence
	# attr_accessor :name, :age, :eye_color  #creates getters and setters on a ruby class

	attr_accessor :is_angry  #this is not related to the mongoid persistance layer, it won't be saved in db

	field :name, type: String  # these are the persistence fields in mongoid
	field :age, type: Integer  # field also creates getters and setters?
	field :is_a_clown, type: Boolean, default: false
end
