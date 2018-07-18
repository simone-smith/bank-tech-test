# Bank Tech Test

This is my response to a practice tech test in my 10th week at Makers Academy, the aim of which was to practice and demonstrate my OO design and TDD skills.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## How I approached designing my solution to the problem

I began by turning the requirements into the following user stories:

```
# User Story 1
# As a user
# So that I can avoid carrying too much cash
# I want to be able to deposit money in my bank account and see the deposit reflected in my balance
```
```
# User Story 2
# As a user
# So that I can fill my wallet
# I want to be able to withdraw money from my bank account and see the withdrawal reflected in my balance
```
```
# User Story 3
# As a user
# So that I can track my spending
# I want to print an account summary which details my transactions, balance and dates
```

My next step was to diagram how I thought the end result would be, so as to get a clear idea of what objects would make up the solution and how they would interact with one another.
I wrote a failing feature test to test the desired final output, using a BDD approach, and then used TDD to write smaller unit tests to build the functionality in incremental steps, using the red-green-refactor cycle to drive my decisions on what code to write next. I knew I had solved the problem when my original feature test passed.

## How I structured my code

I started out with all my code in one class (Account), though the result of my initial diagram showed me that I wanted to finish the task with three separate classes. Once I had implemented the required functionality, I extracted a Printer and TransactionHistory class from the Account, so as to adhere to the Single Responsibility Principle; these classes are then injected back into the Account class when a new account is instantiated. As a result, the code will be easier to change if the requirements change in the future.

## How to install and run my code and tests

- Clone this repository to your machine
- In the console:
 - run `bundle install`
 - run `rspec` to check the tests are passing
 - open `irb` and load the file (`require './lib/account.rb'`)

A screenshot of how the app works is below:

```
[simonesmith:...demy/week_10/bank-tech-test]$ irb
2.5.0 :001 > require './lib/account.rb'
 => true
2.5.0 :002 > account = Account.new
 => #<Account:0x00007fce938def28 @balance=0, @transaction_history=#<TransactionHistory:0x00007fce938dee10 @log=[]>, @printer=#<Printer:0x00007fce938dec58>>
2.5.0 :003 > account.deposit(100)
 => [{:date=>"17/07/2018", :credit=>"100.00", :debit=>"", :balance=>"100.00"}]
2.5.0 :004 > account.withdraw(25)
 => [{:date=>"17/07/2018", :credit=>"100.00", :debit=>"", :balance=>"100.00"}, {:date=>"17/07/2018", :credit=>"", :debit=>"25.00", :balance=>"75.00"}]
2.5.0 :005 > account.withdraw(40)
 => [{:date=>"17/07/2018", :credit=>"100.00", :debit=>"", :balance=>"100.00"}, {:date=>"17/07/2018", :credit=>"", :debit=>"25.00", :balance=>"75.00"}, {:date=>"17/07/2018", :credit=>"", :debit=>"40.00", :balance=>"35.00"}]
2.5.0 :006 > account.print_statement
date || credit || debit || balance
17/07/2018 ||  || 40.00 || 35.00
17/07/2018 ||  || 25.00 || 75.00
17/07/2018 || 100.00 ||  || 100.00
 => [{:date=>"17/07/2018", :credit=>"100.00", :debit=>"", :balance=>"100.00"}, {:date=>"17/07/2018", :credit=>"", :debit=>"25.00", :balance=>"75.00"}, {:date=>"17/07/2018", :credit=>"", :debit=>"40.00", :balance=>"35.00"}]
2.5.0 :007 > exit
```

## Test coverage

```
Account
  starts with a balance of 0
  prints a statement
  deposit
    updates the balance when money is deposited
    returns the transaction log when money is deposited
  withdraw
    updates the balance when money is withdrawn
    returns the transaction log when money is withdrawn

Printing a bank statement
  shows a list of transactions, with their dates and rolling balance

Printer
  prints the statement

TransactionHistory
  stores a deposit in the log
  stores a withdrawal in the log

Finished in 0.01568 seconds (files took 0.2879 seconds to load)
10 examples, 0 failures


COVERAGE: 100.00% -- 99/99 lines in 7 files
```

All tests are passing, and SimpleCov confirms that I have 100% test coverage.
