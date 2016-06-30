require 'account'
require 'print_statement'
require 'timecop'


describe PrintStatement do
  let(:empty_printer) { described_class.new(empty_account) }
  let(:printer1) { described_class.new(acc) }
  let(:empty_account) { double(:account, transactions: []) }
  let(:acc) {Account.new}

  it "given no transactions, it says so" do
    msg = "no recorded transactions"
    expect(empty_printer.generate_statement()).to eq msg
  end

  it "given 1 line transaction, it prints it" do
    t = Timecop.freeze(Time.local(2016,6,28))
    transaction = PrintStatement::HEADER + "28-06-2016 || 1000.00 || || 1000.00\n"
    acc.make("deposit",1000)
    expect(printer1.generate_statement()).to eq transaction
  end
end