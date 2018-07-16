require 'transaction_history'

describe TransactionHistory do

  subject(:transaction_history) { TransactionHistory.new }

  let(:date) { Time.new(2018, 7, 16).strftime("%d/%m/%Y") }

  it "stores a deposit in the log" do
    transaction_history.add_transaction({ date: date, credit: 20, debit: "", balance: 20 })

    expect(transaction_history.log).to eq [{ date: date, credit: 20, debit: "", balance: 20 }]
  end

  it "stores a withdrawal in the log" do
    transaction_history.add_transaction({ date: date, credit: 30, debit: "", balance: 30})
    transaction_history.add_transaction({ date: date, credit: "", debit: 15, balance: 15})

    expect(transaction_history.log).to eq [{ date: date, credit: 30, debit: "", balance: 30 }, { date: date, credit: "", debit: 15, balance: 15 }]
  end
end
