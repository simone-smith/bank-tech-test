require 'account'

# User Story 1
# As a user
# So that I can track my spending
# I want to print an account summary which details my transactions, balance and dates

describe "Printing a bank statement" do

  subject(:account) { Account.new }
  subject(:transaction_history) { TransactionHistory.new }
  subject(:printer) { Printer.new }

  it "shows a list of transactions, with their dates and rolling balance" do
    date1 = Time.new(2018, 7, 14).strftime("%d/%m/%Y")
    date2 = Time.new(2018, 7, 15).strftime("%d/%m/%Y")
    date3 = Time.new(2018, 7, 16).strftime("%d/%m/%Y")

    account.deposit(10, date1)
    account.withdraw(5, date2)
    account.deposit(20, date3)
    expect{account.print_statement}.to output(%Q(date || credit || debit || balance\n16/07/2018 || 20 ||  || 25\n15/07/2018 ||  || 5 || 5\n14/07/2018 || 10 ||  || 10\n)).to_stdout
  end
end
