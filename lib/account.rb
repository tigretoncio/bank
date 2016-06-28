require 'date'

class Account
  OVERDRAFT_LIMIT = 1000
  OVERDRAFT_ERROR = "Transaction failed: Maximumm overdraft exceeded"
  attr_reader :balance, :timestamp,
              :transaction_type, :amount, :statement


  def initialize()
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    save_details(amount,"credit")
    log_transaction()
  end

  def withdraw(amount)
    fail OVERDRAFT_ERROR if balance - amount < -OVERDRAFT_LIMIT
    @balance -= amount
    save_details(amount, "debit")
    log_transaction()
  end

  private

    def log_transaction()

      current = [get_date(timestamp), transaction_type, amount, balance]
      statement << current
    end

    def save_details(amount, type)
      @timestamp = Time.now
      @amount = amount
      @transaction_type = type
    end

    def get_date(date)
      date.strftime("%d %m %Y")
    end
end