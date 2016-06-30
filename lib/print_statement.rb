class PrintStatement
  HEADER = "date || credit || debit  || balance\n".freeze
  EMPTY = "no recorded transactions".freeze

 attr_reader :date, :amount, :type, :amount, :statements, :result

  def initialize(account)
    @account = account
    @statements = @account.transactions.reverse
  end

  def generate_statement()
    return EMPTY if @statements == []
    @result = HEADER
    @statements.each do |transaction|
    @result += transaction.get_transaction()
    end
    @result
  end

  def print_result()
    print @result
  end

  private

    def filter_sort(type)
      case type
      when "deposits"
      when "withdraws"
      when "asc"
      when "desc"
      end
    end

end