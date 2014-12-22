json.array!(@orders) do |order|
  json.extract! order, :id, :article_id, :quantity, :price_unit, :price_total, :invoice_id
  json.url order_url(order, format: :json)
end
