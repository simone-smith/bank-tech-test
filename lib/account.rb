require 'date'
require_relative 'transaction_history'
require_relative 'printer'

class Account

  DATE = Time.now.strftime("%d/%m/%Y")

  attr_reader :balance, :transaction_history

  def initialize(transaction_history = TransactionHistory.new, \
    printer = Printer.new)
    @balance = 0
    @transaction_history = transaction_history
    @printer = printer
  end

  def deposit(amount, date = DATE)
    @balance += sprintf('%.2f', amount).to_f
    @transaction_history.add_transaction({ date: date, credit: \
      sprintf('%.2f', amount), balance: sprintf('%.2f', @balance) })
  end

  def withdraw(amount, date = DATE)
    @balance -= sprintf('%.2f', amount).to_f
    @transaction_history.add_transaction({ date: date, \
      debit: sprintf('%.2f', amount), balance: sprintf('%.2f', @balance) })
  end

  def print_statement
    @printer.print_statement(@transaction_history.log)
  end

end
