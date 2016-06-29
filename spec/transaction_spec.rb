require 'transaction'
require 'timecop'

describe Transaction do
  subject(:transaction) { described_class.new("credit", 1000) }
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
  end
end