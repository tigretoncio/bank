require 'transaction'
require 'timecop'

describe Transaction do
  subject(:transaction) { described_class.new("credit", 1000, 1000) }
  let(:withdraw) { described_class.new("debit", 100, 900)}

  context 'initialization' do
    it 'date is the current date' do
      t = Timecop.freeze(Time.local(2016,3,12))
      expect(transaction.date).to eq "12-03-2016"
    end

    it 'type is correct' do
      type = "credit"
      expect(transaction.type).to eq type
    end

    it 'amount is correct on deposits' do
      amount = 1000
      expect(transaction.amount).to eq amount
    end

    it 'amount is correct on withdraws' do
      amount = 100
      expect(withdraw.amount).to eq amount
    end

    it "when a deposit happens, line can correctly printed" do
      today = Time.now.strftime("%d-%m-%Y")
      result = "#{today} ||  || 1000.00 || 1000.00\n"
      expect(transaction.get_transaction).to eq result
    end

    it "when a withdraw happens, line can be correctly printed" do
      today = Time.now.strftime("%d-%m-%Y")
      result = "#{today} ||  || 1000.00 || 1000.00\n"
      expect(transaction.get_transaction).to eq result
    end
  end
end