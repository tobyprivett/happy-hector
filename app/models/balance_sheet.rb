class BalanceSheet
  include ActiveModel::Model

  attr_accessor(
    :retained_profit,
    :bank_accounts,
    :open_invoices
  )

  class << self
    def for(user)
      BalanceSheet.new(
        retained_profit: ProfitAndLossSummary.find(user),
        bank_accounts: BankAccount.all(user),
        open_invoices: OpenInvoice.all(user)
      )
    end
  end
end
