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
      expect(change{account.balance}.by(2000))
    end
  end
end