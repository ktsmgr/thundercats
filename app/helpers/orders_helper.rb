module OrdersHelper
	def prettify_address(customer)
		#customer is the object we're passing into this method
		address = customer.addy1

		address += "<br>" + customer.addy2 if ! customer.addy2.blank?
		#if addy2 is not blank
		#since the if ! (or unless) executes a single line of code, this can be written after the line of code and end isn't necessary.
		
		address += "<br>" + customer.city
		address += ", " + customer.state
		address += " " + customer.zip
		#return address 
		#the return isn't needed for Ruby
	end
end
