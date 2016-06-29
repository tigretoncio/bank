require 'account'
require 'date'

describe Account do
  let(:transaction) { double(date: "24-04-2015", type: "credit", amount: 1000) }
  subject(:account) { described_class.new }

  context "on initialization" do
    it "balance starts at zero" do
      expect(account.balance).to eq 0
    end
  end

  context "adding deposits" do
    it "when deposit of 2000, balance increases by 2000" do
      account.make("deposit", 2000)
      expect(change{ account.balance }.by(2000))
    end
  end

  context "withdrawing money" do
    it "when withdrawing 500, balance reduces by 500" do
      account.make("deposit", 2000)
      account.make("withdraw", 500)
      expect(change{ account.balance }.by(-500))
    end

    it "when withdrawing money with balance 0, overdraft allowed" do
      account.make("withdraw", 250)
      expect(account.balance).to eq -250
    end

    it "if overdraft exceeded, transaction error" do
      expect{ account.make("withdraw", 1001) }.to raise_error Account::OVERDRAFT_ERROR
    end
  end

  context "account statement" do
    xit "when a deposit is done today, date is logged" do
      account.make("deposit", 500)
      today = Time.now.strftime("%d %m %Y")
      expect(account.timestamp.strftime("%d %m %Y")).to eq today
    end

    xit "when a deposit is done, transaction type credit is registered" do
      account.make("deposit", 100)
      expect(account.transaction_type).to eq "credit"
    end
  end
end