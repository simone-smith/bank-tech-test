require 'transaction_history'

describe TransactionHistory do

  subject(:transaction_history) { TransactionHistory.new }

  it "saves a transaction to the log" do
    transaction_history.add_transaction({ date: 16 / 07 / 2018, credit: 10, debit: "", balance: 10 })
    expect(transaction_history.log).to eq [{ date: 16 / 07 / 2018, credit: 10, debit: "", balance: 10 }]
  end
end
