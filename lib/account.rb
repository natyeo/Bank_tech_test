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
    if amount > @balance
      raise "Not enough funds, current balance: #{@balance}"
    else
      @balance -= amount
    end
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
