require 'account'

describe Account do

  subject(:account) { Account.new(transaction_history, printer) }

  let(:transaction_history) { double :transaction_history, :log => [] }
  let(:transaction_log) { [] }
  let(:printer) { double :printer, print_statement: "date || credit || debit || balance\n16/07/2018 ||  || 15.00 || 15.00 || \n16/07/2018 || 30.00 ||  || 30.00\n" }

  it "starts with a balance of 0" do
    expect(account.balance).to eq 0
  end

  context 'deposit' do

    before do
      allow(transaction_history).to receive(:add_transaction) { transaction_log }
    end

    it "updates the balance when money is deposited" do
      account.deposit(10)
      expect(account.balance).to eq 10
    end

    it "returns the transaction log when money is deposited" do
      expect(account.deposit(10)).to eq transaction_log
    end
  end

  context 'withdraw' do

    before do
      allow(transaction_history).to receive(:add_transaction) { transaction_log }
    end

    it "updates the balance when money is withdrawn" do
      account.deposit(30)
      account.withdraw(15)
      expect(account.balance).to eq 15
    end

    it "returns the transaction log when money is withdrawn" do
      expect(account.withdraw(10)).to eq transaction_log
    end
  end

  it "prints a statement" do
    expect(account.print_statement).to eq %Q(date || credit || debit || balance\n16/07/2018 ||  || 15.00 || 15.00 || \n16/07/2018 || 30.00 ||  || 30.00\n)
  end
end
