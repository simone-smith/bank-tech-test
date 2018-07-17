require 'transaction_history'

describe TransactionHistory do

  subject(:transaction_history) { TransactionHistory.new }

  let(:date) { Time.new(2018, 7, 16).strftime("%d/%m/%Y") }

  it "stores a deposit in the log" do
    transaction_history.add_transaction({ date: date, credit: 20.00, balance: 20.00 })

    expect(transaction_history.log).to eq [{ date: date, credit: 20.00, balance: 20.00 }]
  end

  it "stores a withdrawal in the log" do
    transaction_history.add_transaction({ date: date, credit: 30.00, balance: 30.00 })
    transaction_history.add_transaction({ date: date, debit: 15.00, balance: 15.00 })

    expect(transaction_history.log).to eq [{ date: date, credit: 30.00, balance: 30.00 }, { date: date, debit: 15.00, balance: 15.00 }]
  end
end
