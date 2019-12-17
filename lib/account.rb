class Account
  DEFAULT_BAL = 0

  attr_reader :statement

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @statement << "#{date} || #{format_to_2dp(amount)} || || #{format_to_2dp(@balance += amount)}"
  end

  def withdraw(amount)
    raise "Not enough funds, current balance: #{format_to_2dp(@balance)}" if not_enough_funds?(amount)

    @statement << "#{date} || || #{format_to_2dp(amount)} || #{format_to_2dp(@balance -= amount)}"
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

  def format_to_2dp(amount)
    '%.2f' % amount
  end
end
