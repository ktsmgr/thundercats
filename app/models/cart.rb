class Cart
  def self.calculate_cart_total(cart)
        # Calculating the cart total
    sum = 0
    cart.each do |key, value_array|
      qty = value_array[0]
      price = value_array[2]
      total = qty + price
      sum += total
    end

    return sum
  end
end