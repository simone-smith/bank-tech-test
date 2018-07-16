require 'date'

class Account

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
    @log = []
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount
    transaction = { date: date, credit: amount, debit: "", balance: @balance }
    @log.push(transaction)
  end

  def print_transaction_history
    @log.each do |transaction|
      return %Q(date || credit || debit || balance
      #{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]})
    end
  end

end
