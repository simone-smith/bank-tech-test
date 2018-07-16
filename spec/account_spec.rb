require 'account'

describe Account do

  subject(:account) { Account.new(transaction_history) }

  let(:transaction_history) { double :transaction_history, :log => [] }

  it "starts with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "updates the balance when money is deposited" do
    allow(transaction_history).to receive(:add_transaction)
    date = Time.new(2018, 7, 15).strftime("%d/%m/%Y")
    account.deposit(10, date)
    expect(account.balance).to eq 10
  end

  it "stores the date of a deposit" do
    transaction_history.log.push({ date: Time.new(2018, 7, 16).strftime("%d/%m/%Y"), credit: 20, debit: "", balance: 20 })
    expect(account.print_statement).to eq %Q(date || credit || debit || balance\n16/07/2018 || 20 ||  || 20 || )
  end

  it "updates the balance when money is withdrawn" do
    allow(transaction_history).to receive(:add_transaction)
    date = Time.new(2018, 7, 15).strftime("%d/%m/%Y")
    account.deposit(30, date)
    account.withdraw(15, date)
    expect(account.balance).to eq 15
  end

  it "stores the date of a withdrawal" do
    transaction_history.log.push({ date: Time.new(2018, 7, 16).strftime("%d/%m/%Y"), credit: 30, debit: "", balance: 30 })
    transaction_history.log.push({ date: Time.new(2018, 7, 16).strftime("%d/%m/%Y"), credit: "", debit: 15, balance: 15 })
    expect(account.print_statement).to eq %Q(date || credit || debit || balance\n16/07/2018 ||  || 15 || 15 || \n16/07/2018 || 30 ||  || 30 || )
  end
end
