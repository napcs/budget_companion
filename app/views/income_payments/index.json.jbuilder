json.array!(@income_payments) do |income_payment|
  json.extract! income_payment, :id, :gross_income, :net_income, :paymentDate
  json.url income_payment_url(income_payment, format: :json)
end
