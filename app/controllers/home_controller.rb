class HomeController < ApplicationController
  def show
    @balance_sheet = BalanceSheet.new(retained_profit: '12345')
  end
end
