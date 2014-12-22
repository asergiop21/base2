json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :customer_id, :price_total
  json.url invoice_url(invoice, format: :json)
end
