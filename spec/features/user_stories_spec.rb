require 'account'
require 'timecop'
describe "user stories" do
  # as a client
  # so that I can start with a clear bank account
  # a new account should have balance of zero
  let(:account) { Account.new }

  before do
    t = Timecop.freeze(Time.local(2012,1,10))
    account.make("deposit", 1000)
    t = Timecop.freeze(Time.local(2012,1,13))
    account.make("deposit", 2000)
    t = Timecop.freeze(Time.local(2012,1,14))
    account.make("withdraw", 500)
  end

  # as a client
  # so that I can add money to my account
  # I want to deposit money

  # as a client
  # so that I can get my hard earned money
  # I want to withdraw money from my account



  it "account accepts deposits and withdraws" do
    expect(account.balance).to eq 2500
  end
end


# acc = Account.new
# acc.deposit(1000)
# acc.deposit(2000)
# acc.withdraw(500)
# p = PrintStatement.new(acc)
# p.print_statement()