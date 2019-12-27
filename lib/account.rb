require_relative 'statement'

class Account
  DEFAULT_BAL = 0.0

  def initialize(balance = DEFAULT_BAL, statement = Statement.new)
    @balance = balance
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    create_transaction(deposit: amount)
  end

  def withdraw(amount)
    raise "Not enough funds, current balance: #{@balance}" if not_enough_funds?(amount)

    @balance -= amount
    create_transaction(withdraw: amount)
  end

  def print_statement
    @statement.printer(@transactions)
  end

  private

  def not_enough_funds?(amount)
    amount > @balance
  end

  def create_transaction(deposit: nil, withdraw: nil)
    if deposit
      @transactions << { date: Time.now, transaction: :deposit, amount: deposit, balance: @balance }
    elsif withdraw
      @transactions << { date: Time.now, transaction: :withdrawal, amount: withdraw, balance: @balance }
    end
  end
end
