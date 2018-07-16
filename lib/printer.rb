class Printer

  def print_statement(log)
    print "date || credit || debit || balance\n"
    log.reverse_each do |transaction|
      print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end

end
