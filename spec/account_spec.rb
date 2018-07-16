require 'account'

describe Account do

  subject(:account) { Account.new(transaction_history, printer) }

  let(:transaction_history) { double :transaction_history, :log => [] }
  let(:printer) { double :printer }

  it "starts with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "updates the balance when money is deposited" do
    allow(transaction_history).to receive(:add_transaction)
    account.deposit(10, described_class::DATE)
    expect(account.balance).to eq 10
  end

  it "updates the balance when money is withdrawn" do
    allow(transaction_history).to receive(:add_transaction)
    account.deposit(30, described_class::DATE)
    account.withdraw(15, described_class::DATE)
    expect(account.balance).to eq 15
  end

  it "prints a statement" do
    allow(printer).to receive(:print_statement).and_return(%Q(date || credit || debit || balance\n16/07/2018 ||  || 15 || 15 || \n16/07/2018 || 30 ||  || 30 || ))

    expect(account.print_statement).to eq %Q(date || credit || debit || balance\n16/07/2018 ||  || 15 || 15 || \n16/07/2018 || 30 ||  || 30 || )
  end
end
