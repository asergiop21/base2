json.array!(@accounting_records) do |accounting_record|
  json.extract! accounting_record, :id, :detail, :debit, :credit
  json.url accounting_record_url(accounting_record, format: :json)
end
