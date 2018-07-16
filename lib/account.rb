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

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance -= amount
    transaction = { date: date, credit: "", debit: amount, balance: @balance }
    @log.push(transaction)
  end

  def print_statement
    statement = "date || credit || debit || balance"
    @log.reverse_each do |transaction|
      statement << "\n"
      transaction.each do |key, value|
        statement << "#{transaction[key]} || "
      end
    end
    statement
  end

end
