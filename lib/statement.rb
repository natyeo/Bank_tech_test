require_relative 'account'
class Statement
  def initialize(account)
    @account = account
  end

  def print
    "date || credit || debit || balance\n#{@account.statement.reverse.join("\n")}"
  end
end
