require 'transaction'
require 'timecop'

describe Transaction do
  subject(:transaction) { described_class.new("credit", 1000, 0) }
  let(:withdraw) { desccribed_class.new("debit", 100)}

  context 'initialization' do
    it 'date is the current date' do
      t = Timecop.freeze(Time.local(2016,3,12))
      expect(transaction.date).to eq "12-03-2016"
    end

    it 'type is correct' do
      type = "credit"
      expect(transaction.type).to eq type
    end

    it 'amount is correct' do
      amount = 1000
      expect(transaction.amount).to eq amount
    end

    xit "when a transaction happens, all details are stored" do
      today = Time.now.strftime("%d-%m-%Y")
      account.deposit(200)
      expect(account.statement).to include([today, "credit",200,200])
    end
  end
end