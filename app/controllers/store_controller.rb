class StoreController < ApplicationController

  add_breadcrumb "home", :store_index_path
  #added for breadcrumbs

  def index
    category_name = params[:category_name]
    if category_name.blank?
      @products = Product.where('quantity > 0').order(:name).page params[:page]

  	#We are assigning an array of all products
    #If category_id is blank, give me all the products
    #Changing id to name. We're pulling name from category
    #.where('quantity > 0') was added to limit the actions to run only when there is inventory for a particular item.
    else
      @products = Category.find_by_name(category_name).products.where('quantity > 0').order(:name).page params[:page]

      #Else, find all categories that are associated with the products that match the category_id
      #Changing to category_name: Use find_by_name to search for category name in the row in the Category table. 
      #appl.html also has to change from id to name too

      add_breadcrumb category_name.downcase, products_by_category_path(category_name)
    #added for breadcrumbs
    end

  	#session.clear 
  	#Use this to clear bad records manually
  	if session[:cart].nil?
  		session[:cart] = {}
  	end

  	@cart = session[:cart]
  	#@cart instance variable contains all the items in the cart
    
    @sum = Cart.calculate_cart_total(@cart)
    #To instantiate and then call the Class method

  end #def index


  #added to define the method for deleting cart line items
  def remove_cart_item
    product_id = params[:product_id]
    @cart = session[:cart]
    @cart.delete(product_id)
    #to delete the line item completely (can't use nil)
    
    #@sum = Cart.calculate_cart_total(@cart)
    redirect_to store_index_path
  end


  def add_cart
  	product_id = params[:product_id]
  	quantity = params[:quantity].to_i
  	@product_name = params[:product_name]
  	price = params[:price].to_f

  	if session[:cart].nil?
  		session[:cart] = {}
  	end

  	current_cart = session[:cart]
  	
  	if current_cart[product_id].nil?
  		current_cart[product_id] = [quantity, @product_name, price]
  	else
  		value_array = current_cart[product_id]
  		old_quantity = value_array[0]
  		new_quantity = old_quantity + quantity
  		current_cart[product_id] = [new_quantity, @product_name, price]
  	end
 
 		@cart = current_cart


 		Rails.logger.info "CART= #{session[:cart]}"
 		#This is like a PUTS: Helps you to write the string to the server log

    @sum = Cart.calculate_cart_total(@cart)
    #To instantiate and then call the Class method
  end #def add_cart

  def contact_us
  end

end #Class StoreController
