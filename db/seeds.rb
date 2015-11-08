# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:


account = Account.create(email: "demo@example.com", password: "1234demo", password_confirmation: "1234demo")

["Pets", "Housing", "Kids", "Transportation", "Groceries", "Clothes",
 "Restaurants", "Entertainment", "Savings", "Work", "Charity", "Utilities",
 "Medical", "Household Items", "Child Support", "Alimony", "Personal Care",
 "Debts and Loans", "Retirement", "Gifts"].each do |category|
  Category.create title: category
end

utilities = Category.find_by_title "Utilities"
work = Category.find_by_title "Work"

cable = account.expenses.build( name: "Cable Bill", amount: 59.99, dueDate: "2015-12-06", paymentDate: "2015-12-06", lateFee: 9.99, apr: 9.99, paid: false)
cable.category = utilities
cable.save!

account.expenses.create( name: "Cellular Bill", amount: 80.99, dueDate: "2015-11-13", paymentDate: "2015-12-10", lateFee: 9.99, apr: 9.99, paid: false)
account.expenses.create( name: "Mortgage", amount: 1425.31, dueDate: "2015-11-15", apr: 4.36, paid: false)

paycheck = account.incomes.build( income_source: "Paycheck", gross_income: 1000, net_income: 850)
paycheck.category = work
paycheck.save!

paycheck = account.incomes.build( income_source: "Royalty payments", gross_income: 300, net_income: 850)

