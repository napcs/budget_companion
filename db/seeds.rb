# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:


account = Account.create(email: "demo@napcs.com", password: "1234demo", password_confirmation: "1234demo")

["Pets", "Home", "Kids", "Transportation", "Groceries", "Clothes", "Restaurants", "Entertainment", "Savings"].each do |category|
  Category.create title: category
end

home = Category.find_by_title "Home"

cable = account.expenses.create( name: "Cable Bill", amount: 59.99, dueDate: "2015-12-06", paymentDate: "2015-12-06", lateFee: 9.99, apr: 9.99, paid: false)
cable.category = home

account.expenses.create( name: "Cellular Bill", amount: 80.99, dueDate: "2015-12-06", paymentDate: "2015-12-10", lateFee: 9.99, apr: 9.99, paid: false)

