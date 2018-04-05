class HomeController < ApplicationController
  def show
    @balance_sheet =
      OpenStruct.new(
        retained_profit:
          ProfitAndLossSummary.find(current_user),
        bank_accounts: BankAccount.all(current_user)
      )
  end
end
