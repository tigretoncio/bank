require 'date'

class Account
  OVERDRAFT_LIMIT = 1000
  OVERDRAFT_ERROR = "Transaction failed: Maximumm overdraft exceeded"
  attr_reader :balance, :timestamp,
              :transaction_type, :amount, :statement,
              :transaction

  def initialize()
    @balance = 0
    @statement = []
  end

  def make(type, amount)
    case type
    when "deposit"
      @balance += amount
    when "withdraw"
      fail OVERDRAFT_ERROR if balance - amount < -OVERDRAFT_LIMIT
      @balance -= amount
    else
      fail "error: please check operation type"
    end
    # if type == "deposit"
    #   @balance += amount
    # else if type == "withdraw"
    #   fail OVERDRAFT_ERROR if balance - amount < -OVERDRAFT_LIMIT
    #   @balance -= amount
    # else
    #   fail "error: please check operation type"
    # end
    transaction = Transaction.new(type, amount, @balance)
  end

  # def withdraw(amount)
  #   fail OVERDRAFT_ERROR if balance - amount < -OVERDRAFT_LIMIT
  #   @balance -= amount
  #   transaction = Transaction.new("debit", amount, @balance)
  # end

end