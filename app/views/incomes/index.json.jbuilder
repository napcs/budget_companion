json.array!(@incomes) do |income|
  json.extract! income, :id, :income_source, :category, :gross_income, :net_income, :bank_account
  json.url income_url(income, format: :json)
end
