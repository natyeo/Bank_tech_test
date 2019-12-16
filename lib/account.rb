class Account

  DEFAULT_BAL = 0

  def initialize(balance = DEFAULT_BAL)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    @statement << "#{Time.now.strftime('%d/%m/%Y')} || #{amount}.00 || #{@balance}.00"
  end

  def withdraw(amount)
    raise "Not enough funds, current balance: #{@balance}" if amount > @balance
    @balance -= amount
    @statement << "#{Time.now.strftime('%d/%m/%Y')} || #{amount}.00 || #{@balance}.00"
  end

  def show_balance
    @balance
  end

  def statement
    print_statement
  end

  private

  def print_statement
    @statement.reverse.join("\n")
  end

end
