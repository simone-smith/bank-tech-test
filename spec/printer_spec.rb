require 'printer'

describe Printer do

  subject(:printer) { Printer.new }

  let(:date) { Time.new(2018, 7, 16).strftime("%d/%m/%Y") }

  let(:log) { [{ date: date, credit: sprintf('%.2f', 20), debit: "", balance: sprintf('%.2f', 20) }, { date: date, credit: "", debit: sprintf('%.2f', 15), balance: sprintf('%.2f', 5) }] }

  it "prints the statement" do
    expect { printer.print_statement(log) }.to output("date || credit || debit || balance\n16/07/2018 ||  || 15.00 || 5.00\n16/07/2018 || 20.00 ||  || 20.00\n").to_stdout
  end
end
