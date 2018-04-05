class BankAccount
  include ActiveModel::Model

  attr_accessor(
    :name,
    :current_balance
  )

  class << self
    def all(user)
      FreeagentClient.new(user).bank_accounts.map do |obj|
        BankAccount.new(
          name: obj['name'],
          current_balance: obj['current_balance']
        )
      end
    end
  end
end
