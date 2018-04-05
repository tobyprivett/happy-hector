class BalanceSheet
  include ActiveModel::Model

  attr_accessor(
    :retained_profit,
    :bank_accounts
  )

  class << self
    def for(user)
      BalanceSheet.new(
        retained_profit: ProfitAndLossSummary.find(user),
        bank_accounts: BankAccount.all(user)
      )
    end
  end
end
