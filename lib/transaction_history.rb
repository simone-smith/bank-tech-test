class TransactionHistory

  attr_reader :log

  def initialize
    @log = []
  end

  def add_transaction(transaction)
    @log.push(transaction)
  end

end
