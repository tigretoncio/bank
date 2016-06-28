require 'account'
require 'print_statement'

describe PrintStatement do
  let(:empty_printer) { described_class.new(empty_account) }
  let(:printer1) { described_class.new(depo) }
  let(:empty_account) { double(:account, statement: []) }
  let(:depo) { double(:account, statement: [["28-06-2016", "credit", 1000, 1000]])}

  it "given no transactions, it says so" do
    msg = "no recorded transactions"
    expect(empty_printer.print_statement()).to eq msg
  end

  it "given 1 line transaction, it prints it" do
    transaction = "28-06-2016 || 1000 || || 1000"
    expect(printer1.print_statement()).to eq transaction
  end
end