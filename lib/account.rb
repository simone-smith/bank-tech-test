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
    @balance += format_balance(amount).to_f
    @transaction_history.add_transaction({ date: date, credit: \
      format_balance(amount), balance: format_balance(@balance) })
  end

  def withdraw(amount, date = DATE)
    @balance -= format_balance(amount).to_f
    @transaction_history.add_transaction({ date: date, \
      debit: format_balance(amount), balance: format_balance(@balance) })
  end

  def print_statement
    @printer.print_statement(@transaction_history.log)
  end

  private
    def format_balance(balance)
      sprintf('%.2f', balance)
    end

end
