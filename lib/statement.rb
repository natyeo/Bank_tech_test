require_relative 'account'
class Statement
  def initialize(account)
    @account = account
  end

  def format_statement(statement)
    statement.map do |entry|
      date = format_date(entry[:date])
      amount = format_to_2dp(entry[:amount])
      balance = format_to_2dp(entry[:balance])

      if entry[:transaction] == :deposit
        "#{date} || #{amount} || || #{balance}"
      else
        "#{date} || || #{amount} || #{balance}"
      end
    end
  end

  def print_statement
    headers = "date || credit || debit || balance\n"
    entries = format_statement(@account.statement)
    print headers + entries.reverse.join("\n")
  end

  private

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def format_to_2dp(value)
    format('%0.2f', value)
  end
end
