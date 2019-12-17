require 'statement'

describe Statement do
  let(:account) { double :account }
  let(:statement) { Statement.new(account) }

  describe '#print' do
    it 'prints "16/12/2019 || 1000.00 || || 1000.00" when 1000 deposited' do
      allow(account).to receive(:statement).and_return [{date: Time.now, transaction: :deposit, amount: 1000, balance: 1000}]
      expect(statement.print).to include "#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00"
    end

    it 'prints account statement newest entry first' do
      allow(account).to receive(:statement).and_return [{date: Time.now, transaction: :deposit, amount: 2000, balance: 2000}, {date: Time.now, transaction: :withdrawal, amount: 500, balance: 1500}]
      expect(statement.print).to include "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 1500.00\n#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 2000.00"
    end

    it 'prints account statement with headers' do
      allow(account).to receive(:statement).and_return [{date: Time.now, transaction: :deposit, amount: 1000, balance: 1000}, {date: Time.now, transaction: :deposit, amount: 2000, balance: 3000}, {date: Time.now, transaction: :withdrawal, amount: 500, balance: 2500}]
      expect(statement.print).to eq "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 2500.00\n#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 3000.00\n#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00"
    end
  end
end
