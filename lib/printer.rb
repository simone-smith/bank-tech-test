class Printer

  def print_statement(log)
    statement = "date || credit || debit || balance"
    log.reverse_each do |transaction|
      statement << "\n"
      transaction.each do |key, _value|
        statement << "#{transaction[key]} || "
      end
    end
    statement
  end

end
