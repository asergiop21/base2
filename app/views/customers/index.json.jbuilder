json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :lastname
  json.url customer_url(customer, format: :json)
end
