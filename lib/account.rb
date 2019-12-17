class Account
  DEFAULT_BAL = 0.0

  attr_reader :statement

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @statement << { date: Time.now, transaction: :deposit, amount: amount.to_f, balance: @balance += amount }
  end

  def withdraw(amount)
    raise "Not enough funds, current balance: #{@balance}" if not_enough_funds?(amount)

    @statement << { date: Time.now, transaction: :withdrawal, amount: amount.to_f, balance: @balance -= amount }
  end

  def show_balance
    @balance
  end

  private

  def not_enough_funds?(amount)
    amount > @balance
  end
end
