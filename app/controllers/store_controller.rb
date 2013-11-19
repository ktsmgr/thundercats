class StoreController < ApplicationController
  def index
  	@products = Product.all
  	#We are assigning an array of all products
  	#session.clear 
  	#Use this to clear bad records manually
  	if session[:cart].nil?
  		session[:cart] = {}
  	end

  	@cart = session[:cart]
  	#@cart instance variable contains all the items in the cart
  end

  def add_cart
  	product_id = params[:product_id]
  	quantity = params[:quantity].to_i

  	if session[:cart].nil?
  		session[:cart] = {}
  	end

  	current_cart = session[:cart]
  	
  	if current_cart[product_id].nil?
  		current_cart[product_id] = quantity
  	else
  		old_quantity = current_cart[product_id]
  		current_cart[product_id] = old_quantity + quantity
  	end
 
 		@cart = current_cart
 		Rails.logger.info "CART= #{session[:cart]}"
 		#This is like a PUTS: Helps you to write the string to the server log
  end
end
