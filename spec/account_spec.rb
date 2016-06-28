require 'account'
require 'date'

describe Account do
  subject(:account) { described_class.new }

  context "on initialization" do
    it "balance starts at zero" do
      expect(account.balance).to eq 0
    end
  end

  context "adding deposits" do
    it "when deposit of 2000, balance increases by 2000" do
      account.deposit(2000)
      expect(change{ account.balance }.by(2000))
    end
  end

  context "withdrawing money" do
    it "when withdrawing 500, balance reduces by 500" do
      account.deposit(2000)
      account.withdraw(500)
      expect(change{ account.balance }.by(-500))
    end

    it "when withdrawing money with balance 0, overdraft allowed" do
      account.withdraw(250)
      expect(account.balance).to eq -250
    end

    it "if overdraft exceeded, transaction error" do
      expect{ account.withdraw(1001) }.to raise_error Account::OVERDRAFT_ERROR
    end
  end

  context "account statement" do
    it "when a deposit is done today, date is logged" do
      account.deposit(500)
      today = Time.now.strftime("%d %m %Y")
      expect(account.timestamp.strftime("%d %m %Y")).to eq today
    end

    it "when a deposit is done, transaction type credit is registered" do
      account.deposit(100)
      expect(account.transaction_type).to eq "credit"
    end

    it "when a withdrawal is done, transaction type debit is registered" do
      account.withdraw(100)
      expect(account.transaction_type).to eq "debit"
    end

    it "when a transaction is done, amount is stored" do
      account.withdraw(100)
      expect(account.amount).to eq 100
    end

    it "when a transaction happens, amount is stored" do
      account.deposit(100)
      expect(account.amount).to eq 100
    end

    it "when a transaction happens, all details are stored" do
      today = Time.now.strftime("%d %m %Y")
      account.deposit(200)
      expect(account.statement).to include([today, "credit",200,200])
    end
  end
end