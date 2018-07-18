require 'date'

class Printer
  HEADER = %w(date credit debit balance)
  DELIMITER = ' || '

  def print_statement(log)
    print header + "\n"
    log.reverse_each do |transaction|
      print "#{transaction[:date].strftime("%d/%m/%Y")} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end

  private

  def header
    HEADER.join(DELIMITER)
  end

end
