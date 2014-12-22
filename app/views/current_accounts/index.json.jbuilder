json.array!(@current_accounts) do |current_account|
  json.extract! current_account, :id, :customer_id, :detail, :debit, :credit
  json.url current_account_url(current_account, format: :json)
end
