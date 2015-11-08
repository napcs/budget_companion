json.array!(@expense_payments) do |expense_payment|
  json.extract! expense_payment, :id, :amount, :due_date, :payment_date, :paid
  json.url expense_payment_url(expense_payment, format: :json)
end
