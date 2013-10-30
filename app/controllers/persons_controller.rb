class PersonsController < ApplicationController # notice it's plural because we're working with a collection
	
	# List all persons (show tabel of person in HTML)
	def index
		@persons = Person.all.entries #weird quirk of mongoid that returns a curser, not an array of all
		#@ instance variable
		#@@ class variables

		#render json: @persons #skips the view, and just renders out the json

	end

	# Show detail for a person with ID = params[:id] (in HTML)
	def show
		@person = Person.find_by(id: params[:id])
		# render json: @person #skips the view, and just renders out the json
	end

	# Form for adding a new person (in HTML)
	def new
		@person = Person.new
		# render json: @person #skips the view, and just renders out the json
	end

	# POST to this to crea a new person, then redirect to show
	def create
		@person = Person.create(person_params)
		redirect_to person_url(@person)
	end

	#Form for updating a person with ID = params[:id] (in HTML)
	def edit
		@person = Person.find_by(id: params[:id])
		# @person.save
		# render json: @person #skips the view, and just renders out the json
	end

	# PUT or PATCH to this to update person with ID = params[:id] , then redirect to show
	def update
		@person = Person.find_by(id: params[:id])
		@person.update_attributes(person_params)

		# Same as below!
		# @person.name = params[:person][:name]
		# @person.age = params[:person][:age]
		# @person.is_a_clown = params[:person][:is_a_clown]
		# @person.save

		# redirect_to 'index'
		redirect_to person_url(@person)  # the prefix from rake routes, could also use path..
	end
	
	# Destroy the person with ID = params[:id]
	# then redirect to index to list remaining persons
	def destroy
		@person = Person.find_by(id: params[:id])
		@person.destroy
		redirect_to persons_url
	end
	
	def person_params
		params.require(:person).permit(
			:name, :age, :is_a_clown
			)
	end


end
