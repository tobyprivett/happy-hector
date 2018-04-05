module ApplicationHelper
  def number_to_gbp(amount, precision = 2)
    number_to_currency(amount, unit: '£', precision: precision)
  end
end
