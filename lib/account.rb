class Account

  DEFAULT_BAL = 0

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
  end

  def deposit(amount, date)
    @balance += amount
  end

  def show_balance
    @balance
  end

end
