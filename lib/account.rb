require 'date'

class Account
  OVERDRAFT_LIMIT = 1000
  OVERDRAFT_ERROR = "Transaction failed: Maximumm overdraft exceeded"
  attr_reader :balance, :timestamp

  def initialize()
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    @timestamp = Time.now
  end

  def withdraw(amount)
    fail OVERDRAFT_ERROR if balance - amount < -OVERDRAFT_LIMIT
    @balance -= amount
    timestamp = Time.now
  end
end