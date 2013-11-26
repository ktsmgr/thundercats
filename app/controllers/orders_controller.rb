class OrdersController < ApplicationController
	before_filter :authenticate_user!
	#This prevents unauthorized users from viewing the orders page

  def index
  	@orders = Order.order('id desc')
  	#since line items belong to orders, we don't have to do anything to specify line items
  end
end
