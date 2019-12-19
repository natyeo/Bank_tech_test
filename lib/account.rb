class Account
  DEFAULT_BAL = 0.0

  attr_reader :statement

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @statement = []
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

  def create_transaction(deposit: nil, withdraw: nil)
    if deposit
      @statement << { date: Time.now, transaction: :deposit, amount: deposit, balance: @balance }
    elsif withdraw
      @statement << { date: Time.now, transaction: :withdrawal, amount: withdraw, balance: @balance }
    end
  end

  private

  def not_enough_funds?(amount)
    amount > @balance
  end
end
