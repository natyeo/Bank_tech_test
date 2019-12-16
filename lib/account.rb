class Account

  DEFAULT_BAL = 0

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @statement = []
  end

  def deposit(amount, date)
    @balance += amount
    @statement << "#{date} || #{amount}.00 || #{@balance}.00"
  end

  def withdraw(amount, date)
    raise "Not enough funds, current balance: #{@balance}" if amount > @balance
    @balance -= amount
    @statement << "#{date} || #{amount}.00 || #{@balance}.00"
  end

  def show_balance
    @balance
  end

  def statement
    print_statement
  end

  private

  def print_statement
    @statement
  end

end
