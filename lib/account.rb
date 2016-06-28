class Account
  OVERDRAFT_LIMIT = 1000
  OVERDRAFT_ERROR = "Transaction failed: Maximumm overdraft exceeded"
  attr_reader :balance

  def initialize()
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail OVERDRAFT_ERROR if balance - amount < -OVERDRAFT_LIMIT
    @balance -= amount
  end
end