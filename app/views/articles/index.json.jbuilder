json.array!(@articles) do |article|
  json.extract! article, :id, :name, :price_cost, :percentaje, :price_total, :quantity, :barcode, :supplier_id
  json.url article_url(article, format: :json)
end
