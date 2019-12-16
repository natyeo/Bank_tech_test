class Account

  DEFAULT_BAL = 0

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
  end

  def deposit(amount, date)
    @balance += amount
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

end
