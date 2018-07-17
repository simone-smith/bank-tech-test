#!/usr/bin/env ruby

require './lib/account.rb'

account = Account.new

account.deposit(10)
account.withdraw(5)
account.print_statement
