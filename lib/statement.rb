require_relative 'account'
class Statement
  def initialize(account)
    @account = account
  end

  def format_records(statement)
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

  def print
    headers = "date || credit || debit || balance\n"
    records = format_records(@account.statement)
    headers + records.reverse.join("\n")
  end

  private

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def format_to_2dp(amount)
    '%.2f' % amount
  end
end
