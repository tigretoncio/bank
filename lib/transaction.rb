class Transaction
  attr_reader :date, :type, :amount, :log

  def initialize(type, amount)
    @date = get_date(Time.now)
    @type = type
    @amount = amount
  end

  private
    def get_date(date)
        date.strftime("%d-%m-%Y")
    end

end