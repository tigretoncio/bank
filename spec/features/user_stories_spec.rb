require 'account'
describe "user stories" do
  # as a client
  # so that I can start with a clear bank account
  # a new account should have balance of zero
  let(:account) { Account.new }
  it "Bank account starts with balance 0" do
    expect(account.balance).to be 0
  end
  # as a client
  # so that I can add money to my account
  # I want to deposit money

  it "account accepts deposits" do
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end
  # as a client
  # so that I can get my hard earned money
  # I want to withdraw money from my account

  it "account accepts withdraws " do
    account.deposit(10000)
    account.withdraw(5000)
    expect(account.balance).to eq 5000
  end
end