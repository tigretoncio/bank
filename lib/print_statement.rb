class PrintStatement
  HEADER ="date || credit || debit || balance ".freeze
  EMPTY = "no recorded transactions".freeze

 attr_reader :date, :amount, :type, :amount, :statements, :result

  def initialize(account)
    @account = account
    @statements = @account.transactions.reverse
  end

  def print_statement()
    return EMPTY if @statements == []
    result = HEADER
    @statements.each do |transaction|
      result += transaction.get_transaction()
    end
    result
  end

  def print_result()
    print result
  end

  private

    def get_data(index)
      @date = statements[index][0]
      @type = statements[index][1]
      @amount = statements[index][2]
      @balance = statements[index][3]
    end
end