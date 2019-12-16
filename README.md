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

### How to run the program and tests
1. Run 'bundle install' in command line to install gems
2. Run 'rspec' to run tests and check that all pass and test coverage is > 95%
3. if all tests pass, run 'rubocop' to check readability
4. Run the program in IRB - see example below

```
2.6.3 :001 > require './lib/statement.rb'

 => true
2.6.3 :002 > s = Statement.new(a = Account.new)
 => #<Statement:0x00007f82d0178ea0 @account=#<Account:0x00007f82d0178ef0 @balance=0, @statement=[]>>

2.6.3 :003 > a.deposit(1000)
 => ["16/12/2019 || 1000.00 || || 1000.00"]

2.6.3 :004 > a.withdraw(500)
 => ["16/12/2019 || 1000.00 || || 1000.00", "16/12/2019 || || 500.00 || 500.00"]

2.6.3 :005 > s.print
 => "date || credit || debit || balance\n16/12/2019 || || 500.00 || 500.00\n16/12/2019 || 1000.00 || || 1000.00"

 ```

 ### My approach
- Structured code into two classes: one to handle inflows and outflows and one to handle printing the account statement to ensure cohesion
