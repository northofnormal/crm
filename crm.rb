require "./contact"
require "./database"

class CRM

	def main_menu
		print_main_menu
		@choice = gets.chomp.to_i
		call_option(@choice)
		  	while @choice != 6
				main_menu
			end
	end


	def print_main_menu
		puts "** Main Menu **"
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Delete a contact"
		puts "[4] Display all contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts "Please type the number of your choice:"
	end

	def call_option(choice)
		add_contact if choice == 1
		modify_contact if choice == 2 #in progress
		delete_contact if choice == 3 #in progress
		display_all if choice == 4 
		display_attribute_menu if choice == 5 
		exit if choice == 6 
	end


	def add_contact
		puts "\e[H\e[2J"
		puts "** Adding A New Contact **"
		print "Please enter first name: "
		@first_name = gets.chomp.capitalize 
		print "Please enter last name: "
		@last_name = gets.chomp.capitalize
		print "Please enter email address: "
		@email_address = gets.chomp
		print "Please enter any notes about this contact: "
		@note = gets.chomp
		@contact = {
			:first_name => @first_name, 
			:last_name => @last_name, 
			:email_address => @email_address, 
			:note => @note
		}
		Database.add_contact(@contact)
		puts "You have added #{@first_name} #{@last_name}. Their ID is " 
		puts Database.contacts[-1][:id] 
	end

	def modify_contact
		puts "\e[H\e[2J"
		puts "** Modifying A Contact **"
	 	print "What is the system id of the contact you would like to modify? "
	 	#who = gets.chomp
	 	# frank = Database.contacts.detect {|x| x[:id] == who} 
	 	# puts frank
	 	print "What data would you like to modify? "
	 	#  find the data. 
	 	# replace the data
	end


	def delete_contact
		puts "\e[H\e[2J"
		puts "** Deleting A Contact **"
	 	print "What is the system id of the contact you would like to delete? "
	 	who = gets.chomp
	 	Database.contacts.each do |cont|
	 		puts "I'm deleting #{cont[:first_name]}" if cont[:id] == who
	 	end
	end

	def display_all
		Database.contacts.sort_by {|cont| cont[:last_name]}.each do |cont| puts "ID: #{cont[:id]} --  Name: #{cont[:first_name]} #{cont[:last_name]} -- Email Address: #{cont[:email_address]} -- Notes: #{cont[:note]}"
		end
	end

	def display_attribute_menu
		puts "\e[H\e[2J"
		puts "** Attribute Menu **"
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email address"
		puts "[4] Return to Main Menu"
		puts "Please enter the number of the attribute you'd like to display: "
		attribute_choice = gets.chomp.to_i
		if attribute_choice == 1
			Database.contacts.each do |cont| puts "#{cont[:first_name]}" end
		elsif attribute_choice == 2 
			Database.contacts.each do |cont| puts "#{cont[:last_name]}" end
		elsif attribute_choice == 3
			Database.contacts.each do |cont| puts "#{cont[:email_address]}" end
		elsif attribute_choice == 4 
			main_menu
		end
	end


	def exit
		puts "Goodbye!"
	end
end

a_crm_app = CRM.new
a_crm_app.main_menu