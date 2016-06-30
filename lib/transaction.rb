class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(type, amount, balance)
    @date = Time.now.strftime("%d-%m-%Y")
    @type = type
    @amount = amount
    @balance = balance
  end

  def get_transaction()
    result = "#{@date} || "
    result += @type == "deposit" ? "#{format("%.2f",@amount)} ||" : " || #{format("%.2f",@amount)}"
    result += " || #{format("%.2f",@balance)}\n"
  end

end