require 'account'

# User Story 1
# As a user
# So that I can track my spending
# I want to print an account summary which details my transactions, balance and dates

describe "Printing a bank statement" do

  subject(:account) { Account.new }

  it "shows a list of transactions, with their dates and rolling balance" do
    account.deposit(10)
    account.withdraw(5)
    account.deposit(20)
    expect(account.print_statement).to eq %q(
      date || credit || debit || balance
      16/07/2018 || 20 || || 25
      15/07/2018 || || 5 || 5
      14/07/2018 || 10 || || 10
    )
  end
end

# User Story 2
# As a user
# So that I can avoid carrying too much cash
# I want to be able to deposit money in my bank account and see the deposit reflected in my balance

# User Story 3
# As a user
# So that I can fill my wallet
# I want to be able to withdraw money from my bank account and see the withdrawal reflected in my balance
