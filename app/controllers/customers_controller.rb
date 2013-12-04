class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        # Create order/line-items from Cart
        current_cart = session[:cart]
        order = Order.new
        order.customer_id = @customer.id

        sub_total = Cart.calculate_cart_total(current_cart)
        #Can't access @sum because this is a whole new method

        order.sub_total = sub_total

        order.sales_tax = sub_total * Order::CURRENT_SALES_TAX

        order.grand_total = order.sub_total + order.sales_tax

        order.save

        #Now we have to save LineItems product_id, quantity, unit_price (all from session), and calculate line_item_total
        current_cart.each do |key, item|
          line_item = LineItem.new
          line_item.product_id = key
          line_item.quantity = item[0]
          line_item.unit_price = item[2]
          line_item.line_item_total = line_item.quantity * line_item.unit_price
          line_item.order_id = order.id

          line_item.save

          product = Product.find(line_item.product_id)
          product.quantity = product.quantity - line_item.quantity
          product.save
          #added this code block to remove ordered items from inventory (product list quantity)

        end

        #Added for email delivery
        Notifier.order_confirmation_email(@customer).deliver


          session.delete(:cart)
          #session.clear clears the entire cache for the session after storing the order and line item info into the DB. 
          #session.delete(:cart) clears only the cart items and doesn't log out the users.


        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :phone, :email, :addy1, :addy2, :city, :state, :zip)
    end
end
