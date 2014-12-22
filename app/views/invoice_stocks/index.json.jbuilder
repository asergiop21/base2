json.array!(@invoice_stocks) do |invoice_stock|
  json.extract! invoice_stock, :id, :name
  json.url invoice_stock_url(invoice_stock, format: :json)
end
