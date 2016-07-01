class PrintStatement
  HEADER = "date || credit || debit  || balance\n".freeze
  EMPTY = "no recorded transactions".freeze

 attr_reader :result

  def initialize(account)
    @account = account
    @statements = @account.transactions.reverse
  end

  def generate_statement(type)
    return EMPTY if @statements == []
    @result = HEADER
    filtered_data = filter_sort(type)
    filtered_data.each do |transaction|
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
        return @statements.find_all {|t| t.type == "deposit"}
      when "withdraws"
        return @statements.find_all {|t| t.type == "witdraw"}
      when "asc"
        return @statements.sort_by {|t| t.date}
      when "desc"
        return @statements.sort_by {|t| t.date}.reverse
      else
        return @statements
      end
    end

end