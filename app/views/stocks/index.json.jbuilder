json.array!(@stocks) do |stock|
  json.extract! stock, :id, :article_id, :quantity, :price_cost, :supplier_id
  json.url stock_url(stock, format: :json)
end
