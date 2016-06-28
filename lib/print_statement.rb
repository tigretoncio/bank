class PrintStatement
  HEADER ="date\t||\tcredit\t||\tdebit\t||\tbalance\n".freeze
  EMPTY = "no recorded transactions".freeze

 attr_reader :date, :amount, :type, :amount, :statements

  def initialize(account)
    @account = account
    @statements = @account.statement
  end

  def print_statement()
    print(HEADER)
    return EMPTY if statements == []
    result = ""
    statements.length.times do |i|
      get_data(i)
      result = "#{@date} || "
      if type == "credit"
        result += "#{@amount} || || "
      else
        result += " || #{@amount} ||"
      end
      result += "#{@balance}"
      print result
    end
    result
  end

  private

    def get_data(index)
      @date = statements[index][0]
      @type = statements[index][1]
      @amount = statements[index][2]
      @balance = statements[index][3]
    end

    def check_transaction(type)
    end

end