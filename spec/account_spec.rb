require 'account'

describe Account do
  subject(:account) { described_class.new }

  context "on initialization" do
    it "balance starts at zero" do
      expect(account.balance).to eq 0
    end
  end
end