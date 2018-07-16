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

  it "stores the date of a deposit" do
    date = Time.new(2018, 7, 16).strftime("%d/%m/%Y")
    account.deposit(20, date)
    expect(account.print_statement).to eq %Q(date || credit || debit || balance\n16/07/2018 || 20 ||  || 20 || )
  end

  it "updates the balance when money is withdrawn" do
    date = Time.new(2018, 7, 15).strftime("%d/%m/%Y")
    account.deposit(30, date)
    account.withdraw(15, date)
    expect(account.balance).to eq 15
  end

  it "stores the date of a withdrawal" do
    date = Time.new(2018, 7, 16).strftime("%d/%m/%Y")
    account.deposit(30, date)
    account.withdraw(15, date)
    expect(account.print_statement).to eq %Q(date || credit || debit || balance\n16/07/2018 ||  || 15 || 15 || \n16/07/2018 || 30 ||  || 30 || )
  end
end
