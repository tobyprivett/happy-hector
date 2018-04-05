class BalanceSheet
  include ActiveModel::Model

  attr_accessor(
    :retained_profit,
    :bank_accounts,
    :open_invoices,
    :trial_balance
  )

  def corporation_tax_owed
    trial_balance.try(:corporation_tax_owed)
  end

  def vat_owed
    trial_balance.try(:vat_owed)
  end

  class << self
    def for(user)
      BalanceSheet.new(
        retained_profit: ProfitAndLossSummary.find(user),
        bank_accounts: BankAccount.all(user),
        open_invoices: OpenInvoice.all(user),
        trial_balance: TrialBalance.find(user)
      )
    end
  end
end
