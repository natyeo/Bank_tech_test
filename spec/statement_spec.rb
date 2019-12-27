require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  describe '#printer' do
    it 'prints account statement with headers' do
      transactions = [{ date: Time.new(2019, 12, 16), transaction: :deposit, amount: 1000, balance: 1000 }, { date: Time.new(2019, 12, 17), transaction: :deposit, amount: 2000, balance: 3000 }, { date: Time.new(2019, 12, 18), transaction: :withdrawal, amount: 500, balance: 2500 }]
      expect { statement.printer(transactions) }.to output("date || credit || debit || balance\n18/12/2019 || || 500.00 || 2500.00\n17/12/2019 || 2000.00 || || 3000.00\n16/12/2019 || 1000.00 || || 1000.00").to_stdout
    end
  end
end
