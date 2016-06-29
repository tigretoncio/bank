class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(type, amount, balance)
    @date = Time.now.strftime("%d-%m-%Y")
    @type = type
    @amount = amount
    @balance = balance
  end

  def self.get_transaction()
    result = "#{date} || "
    result += self.type == "credit" ? "#{amount} ||" : " || #{amount}"
    result += " || #{balance}"
  end

end