require 'account'

describe "Account" do
  subject(:account) { Account.new }

  it "starts with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "updates the balance when money is deposited" do
    date = Time.new(2018, 7, 15).strftime("%d/%m/%Y")
    account.deposit(10, date)
    expect(account.balance).to eq 10
  end

  it "stores the date of the deposit" do
    date = Time.new(2018, 7, 16).strftime("%d/%m/%Y")
    account.deposit(20, date)
    expect(account.print_transaction_history).to eq %Q(date || credit || debit || balance
      16/07/2018 || 20 ||  || 20)
  end
end
