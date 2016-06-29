require 'date'

class Account
  OVERDRAFT_LIMIT = 1000
  OVERDRAFT_ERROR = "Transaction failed: Maximumm overdraft exceeded"
  attr_reader :balance, :transactions

  def initialize()
    @balance = 0
    @transactions = []
  end

  def make(type, amount)
    case type
    when "deposit"
      @balance += amount
    when "withdraw"
      fail OVERDRAFT_ERROR if isOverdraft(@balance, amount)
      @balance -= amount
    else
      fail "error: please check operation type"
    end
    transaction = Transaction.new(type, amount, @balance)
    @transactions << transaction
  end

  private
    def isOverdraft(balance, amount)
      balance - amount < -OVERDRAFT_LIMIT
    end
end