require 'printer'

describe Printer do

  subject(:printer) { Printer.new }

  let(:date) { Time.new(2018, 7, 16).strftime("%d/%m/%Y") }

  it "prints the statement" do
    log = [{ date: date, credit: 20, debit: "", balance: 20 }, { date: date, credit: "", debit: 15, balance: 5 }]

    expect(printer.print_statement(log)).to eq %Q(date || credit || debit || balance\n16/07/2018 ||  || 15 || 5 || \n16/07/2018 || 20 ||  || 20 || )
  end
end
