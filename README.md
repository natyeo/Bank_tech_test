Specification
--------------
Requirements
------------
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

Acceptance criteria
-------------------
- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

How to run the program and tests
---------------------------------
1. Run 'bundle install' in the command line to install gems
2. Run 'rspec' to check that tests pass and coverage is > 95%
3. If all tests pass, run 'rubocop' to check readability
4. Run the program in IRB - see example below

```
2.6.3 :001 > require './lib/statement.rb'

 => true
2.6.3 :002 > s = Statement.new(a = Account.new)
 => #<Statement:0x00007f82d0178ea0 @account=#<Account:0x00007f82d0178ef0 @balance=0.0, @statement=[]>>

2.6.3 :003 > a.deposit(1000)
 => [{:date=>2019-12-16 15:32:28 +0000, :transaction=>:deposit, :amount=>1000.0, :balance=>1000.0}]

2.6.3 :004 > a.withdraw(500)
 => [{:date=>2019-12-16 15:32:28 +0000, :transaction=>:deposit, :amount=>1000, :balance=>1000.0}, {:date=>2019-12-16 15:32:28 +0000, :transaction=>:withdrawal, :amount=>500.0, :balance=>500.0}]

2.6.3 :005 > s.print
 => "date || credit || debit || balance
     16/12/2019 || || 500.00 || 500.00
     16/12/2019 || 1000.00 || || 1000.00"

 ```

My approach
------------
- I structured my code into two classes: an Account class to keep track of deposits, withdrawals and the account balance, and a Statement class to handle formatting and printing of the account statement. This was done to ensure as high cohesion as possible.

- The Account class is initialised with a default account balance of 0.0 and has a 'balance' attribute which updates when the deposit and withdrawal methods are called. It also has a 'statement' attribute which stores the history of transactions (with information about the date, amount, transaction type, balance) in an array of hashes.

- The Statement class takes an Account object upon initialisation. When the 'print' method is called, the account statement is injected into a format method which turns the array of hashes into the required format. This is to ensure that methods are each only responsible for a single thing.

- I used variables and private methods where appropriate (for example for the formatting of time) to enhance ease of change and keep my code DRY.

- I used test driven development to develop the program, using IRB for my feature tests and rspec for my unit tests.
