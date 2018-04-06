class BalanceSheetsController < ApplicationController
  def show
    @balance_sheet = BalanceSheet.new(current_user)
  end
end
