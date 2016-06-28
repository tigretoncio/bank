require 'account'

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
  end
end