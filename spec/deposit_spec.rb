require 'account'

describe "Account" do
  subject(:account) { Account.new }

  it "starts with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "updates the balance when money is deposited" do
    account.deposit(10)
    expect(account.balance).to eq 10
  end


end
