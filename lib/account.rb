require 'date'
require_relative 'transaction_history'

class Account

  attr_reader :balance, :transaction_history

  def initialize(transaction_history = TransactionHistory.new)
    @balance = 0
    @transaction_history = transaction_history
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount
    @transaction_history.add_transaction({ date: date, credit: amount, debit: "", balance: @balance })
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance -= amount
    @transaction_history.add_transaction({ date: date, credit: "", debit: amount, balance: @balance })
  end

  def print_statement
    statement = "date || credit || debit || balance"
    @transaction_history.log.reverse_each do |transaction|
      statement << "\n"
      transaction.each do |key, _value|
        statement << "#{transaction[key]} || "
      end
    end
    statement
  end

end
