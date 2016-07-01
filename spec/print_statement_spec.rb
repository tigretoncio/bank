require 'account'
require 'print_statement'
require 'timecop'


describe PrintStatement do
  let(:empty_printer) { described_class.new(empty_account) }
  let(:printer1) { described_class.new(acc) }
  let(:empty_account) { double(:account, transactions: []) }
  let(:acc) {Account.new}

  before do
    time = Timecop.freeze(Time.local(2012,1,10))
    @header = PrintStatement::HEADER
    @empty = PrintStatement::EMPTY
    @tr1 = "10-01-2012 || 1000.00 || || 1000.00\n"
    @tr2 = "13-01-2012 || 2000.00 || || 3000.00\n"
    @tr3 = "14-01-2012 ||  || 500.00 || 2500.00\n"
  end
  context "non-filtered data" do
    it "given no transactions, it says so" do
      expect(empty_printer.generate_statement("")).to eq @empty
    end

    it "given 1 line transaction, it prints it" do
      acc.make("deposit",1000)
      expect(printer1.generate_statement("")).to eq @header+@tr1
    end
  end

  context "filtered data" do
    it "it filters deposits transactions" do
      acc.make("withdraw", 10)
      expect(printer1.generate_statement("deposits")).to eq @header
    end

    it "filters withdraws transactions" do
      acc.make("deposit",1000)
      expect(printer1.generate_statement("withdraws")).to eq @header
    end

    it "sorts by ascending order" do
      acc.make("deposit", 1000)
      time = Timecop.freeze(Time.local(2012,1,13))
      acc.make("deposit", 2000)
      time = Timecop.freeze(Time.local(2012,1,14))
      acc.make("withdraw",500)
      expect(printer1.generate_statement("asc")).to eq @header+@tr1+@tr2+@tr3
    end

    it "sorts by descending order" do
      acc.make("deposit", 1000)
      time = Timecop.freeze(Time.local(2012,1,13))
      acc.make("deposit", 2000)
      time = Timecop.freeze(Time.local(2012,1,14))
      acc.make("withdraw",500)
      expect(printer1.generate_statement("desc")).to eq @header+@tr3+@tr2+@tr1
    end
  end
end