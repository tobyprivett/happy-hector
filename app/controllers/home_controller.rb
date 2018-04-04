class HomeController < ApplicationController
  def show
    @balance_sheet =
      OpenStruct.new(
        retained_profit:
          ProfitAndLossSummary.new(retained_profit: '12345'),
        bank_accounts: [
          BankAccount.new(name: 'RBS', current_balance: -10.91),
          BankAccount.new(name: 'Savings & Loans', current_balance: 290.12)
        ]
      )
  end
end
