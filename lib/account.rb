class Account
  DEFAULT_BAL = 0

  attr_reader :statement

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @statement << "#{date} || #{amount}.00 || || #{@balance += amount}.00"
  end

  def withdraw(amount)
    raise "Not enough funds, current balance: #{@balance}" if not_enough_funds?(amount)

    @statement << "#{date} || || #{amount}.00 || #{@balance -= amount}.00"
  end

  def show_balance
    @balance
  end

  private

  def not_enough_funds?(amount)
    amount > @balance
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end
end
