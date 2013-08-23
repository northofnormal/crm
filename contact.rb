class Contact
	def initialize(first_name, last_name, email_address, note)
		@first_name = first_name
		@last_name = last_name
		@email_address = email_address
		@note = note
	end

	attr_accessor :id

	attr_accessor :first_name

	attr_accessor :last_name

	attr_accessor :email_address

	attr_accessor :note

end

