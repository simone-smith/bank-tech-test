require 'date'

class Printer
  HEADER = %w(date credit debit balance)
  DELIMITER = ' || '

  def print_statement(log)
    print header + row(log)
  end

  private

  def header
    HEADER.join(DELIMITER) + "\n"
  end

  def row(log)
    row = ""
    log.reverse_each do |transaction|
      row << "#{transaction[:date].strftime("%d/%m/%Y")} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    row
  end

end
