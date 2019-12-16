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
end
