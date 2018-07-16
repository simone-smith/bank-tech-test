require 'date'
require_relative 'transaction_history'
require_relative 'printer'

class Account

  attr_reader :balance, :transaction_history

  def initialize(transaction_history = TransactionHistory.new, printer = Printer.new)
    @balance = 0
    @transaction_history = transaction_history
    @printer = printer
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
    @printer.print_statement(@transaction_history.log)
  end

end
