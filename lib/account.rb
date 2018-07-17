require 'date'
require_relative 'transaction_history'
require_relative 'printer'

class Account

  attr_reader :balance, :transaction_history

  def initialize(transaction_history = TransactionHistory.new, \
    printer = Printer.new)
    @balance = 0
    @transaction_history = transaction_history
    @printer = printer
  end

  def deposit(amount, date = Time.now)
    @balance += format_number(amount).to_f
    @transaction_history.add_transaction({ date: date, credit: \
      format_number(amount), balance: format_number(@balance) })
  end

  def withdraw(amount, date = Time.now)
    @balance -= format_number(amount).to_f
    @transaction_history.add_transaction({ date: date, \
      debit: format_number(amount), balance: format_number(@balance) })
  end

  def print_statement
    @printer.print_statement(@transaction_history.log)
  end

  private
    def format_number(amount)
      sprintf('%.2f', amount)
    end

end
