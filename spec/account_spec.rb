require 'account'

describe 'Account' do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'increases the balance by 500 when passed in an amount of 500' do
      account.deposit(500)
      expect(account.show_balance).to eq 500
    end
  end

  describe '#withdraw' do
    it 'decreases balance by 300 when passed in an amount of 300' do
      account.deposit(500)
      account.withdraw(300)
      expect(account.show_balance).to eq 200
    end

    it 'raises an error if withdrawal amount is more than balance' do
      expect { account.withdraw(200) }.to raise_error 'Not enough funds, current balance: 0'
    end
  end

  describe '#statement' do
    it 'prints "16/12/2019 || 500.00 || 500.00" when 500 deposited' do
      account.deposit(500)
      expect(account.statement).to include '16/12/2019 || 500.00 || 500.00'
    end

    it 'prints "16/12/2019 || 200.00 || 300.00" when 500 deposited and 200 withdrawn' do
      account.deposit(500)
      account.withdraw(200)
      expect(account.statement).to include '16/12/2019 || 200.00 || 300.00'
    end

    it 'prints "16/12/2019 || 400.00 || 100.00\n 16/12/2019 || 500.00 || 500.00" when 500 deposited and 400 withdrawn' do
      account.deposit(500)
      account.withdraw(400)
      expect(account.statement).to include "16/12/2019 || 400.00 || 100.00\n16/12/2019 || 500.00 || 500.00"
    end

    it 'prints statement with headers' do
      account.deposit(300)
      expect(account.statement).to eq "date || credit || debit || balance\n16/12/2019 || 300.00 || 300.00"
    end
  end
end
