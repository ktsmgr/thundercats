json.array!(@customers) do |customer|
  json.extract! customer, :name, :phone, :email, :addy1, :addy2, :city, :state, :zip
  json.url customer_url(customer, format: :json)
end
