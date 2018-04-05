class ProfitAndLossSummary
  include ActiveModel::Model

  attr_accessor(
    :retained_profit
  )

  def to_s
    retained_profit
  end

  class << self
    def find(user)
      obj = FreeagentClient.new(user).profit_and_loss_summary

      ProfitAndLossSummary.new(
        retained_profit: obj['retained_profit_carried_forward']
      )
    end
  end
end
