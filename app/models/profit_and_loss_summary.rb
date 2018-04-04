class ProfitAndLossSummary
  include ActiveModel::Model

  attr_accessor(
    :retained_profit
  )

  def to_s
    retained_profit
  end
end
