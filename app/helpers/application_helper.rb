module ApplicationHelper
  def number_to_gbp(amount)
    number_to_currency(amount, unit: '£')
  end
end
