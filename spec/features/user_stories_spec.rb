describe "user stories" do
  # as a client
  # so that I can start with a clear bank account
  # a new account should have balance of zero
  it "Bank account starts with balance 0" do
    account = Account.new
    expect(account.balance).to be 0
  end
end