#  por aquí iba, mover el behaviour de Transaction y de account a Account repo, (array con transactions deposit withdraw y la de "get_transaction", mirar si es necesario moverla de Transaction?? creo que no!)
require 'transaction_repo'
require 'timecop'

describe TransactionRepo do
let(:tr1) { double(:transaction, date: "18-06-2014", type: "deposit", amount: 1000, balance: 1000) }
subject(:repo) { described_class.new}

before do
  t = Timecop.freeze(Time.local(2014,6,18))
end

it "when a deposit happens, line can correctly printed" do
      date = Time.now.strftime("%d-%m-%Y")
      result = "#{dat} ||  || 1000.00 || 1000.00\n"
      expect(transaction.get_transaction).to eq result
    end

    it "when a withdraw happens, line can be correctly printed" do
      today = Time.now.strftime("%d-%m-%Y")
      result = "#{today} ||  || 1000.00 || 1000.00\n"
      expect(transaction.get_transaction).to eq result
    end

end