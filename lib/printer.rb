require 'date'

class Printer
  HEADER = %w(date credit debit balance)
  DELIMITER = ' || '

  def print_statement(log)
    row = ""
    log.reverse_each do |transaction|
      row << "#{transaction[:date].strftime("%d/%m/%Y")} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    print header + row
  end

  private

  def header
    HEADER.join(DELIMITER) + "\n"
  end

end
