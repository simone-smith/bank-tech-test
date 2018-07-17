require 'account'

# User Story 1
# As a user
# So that I can track my spending
# I want to print an account summary which details my transactions, balance and dates

describe "Printing a bank statement" do

  subject(:account) { Account.new }
  let(:transaction_history) { TransactionHistory.new }
  let(:printer) { Printer.new }

  it "shows a list of transactions, with their dates and rolling balance" do
    date1 = Time.new(2018, 7, 14)
    date2 = Time.new(2018, 7, 15)
    date3 = Time.new(2018, 7, 16)

    account.deposit(10, date1)
    account.withdraw(5, date2)
    account.deposit(20, date3)
    expect { account.print_statement }.to output(%Q(date || credit || debit || balance\n16/07/2018 || 20.00 ||  || 25.00\n15/07/2018 ||  || 5.00 || 5.00\n14/07/2018 || 10.00 ||  || 10.00\n)).to_stdout
  end
end
