class StoreController < ApplicationController
  def index
  	@products = Product.all
  	#We are assigning an array of all products
  end

  def add_cart
  end
  
end
