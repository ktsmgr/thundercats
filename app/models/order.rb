class Order < ActiveRecord::Base
	#If you want to group classes together, you can use modules. ActiveRecord is a module. Base is the constant.
	belongs_to :customer
	has_many :line_items

	CURRENT_SALES_TAX = 0.06
	#This is a constant. You call it by calling the class and use double colon (::) and the constant.

	def self.sales_tax_in_percent
		return CURRENT_SALES_TAX * 100
	end
	#self. makes this a class method rather than an instance method

end
