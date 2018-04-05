class HomeController < ApplicationController
  def show
    @balance_sheet = BalanceSheet.for(current_user)
  end
end
