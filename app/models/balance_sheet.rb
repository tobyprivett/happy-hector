class BalanceSheet
  include ActiveModel::Model

  def initialize(user)
    @user = user
  end

  def retained_profit
    @retained_profit ||=
      fa_client.profit_and_loss_summary['retained_profit_carried_forward'].to_f
  end

  def bank_accounts
    @bank_accounts ||=
      fa_client.bank_accounts.map do |obj|
        OpenStruct.new(
          name: obj['name'],
          current_balance: obj['current_balance'].to_f
        )
      end
  end

  def open_invoices
    @open_invoices ||=
      fa_client.open_invoices.map do |obj|
        OpenStruct.new(
          contact_name: obj['contact_name'],
          due_value: obj['due_value'].to_f
        )
      end
  end

  def corporation_tax_owed
    @corporation_tax_owed ||= trial_balance_total(820)
  end

  def vat_owed
    @vat_owed ||= trial_balance_total(817)
  end

  def adjustments
    [
      bank_accounts.sum(&:current_balance),
      open_invoices.sum(&:due_value),
      corporation_tax_owed,
      vat_owed
    ].inject(0, :+) - retained_profit
  end

  private

  def trial_balance
    @trial_balance ||= fa_client.trial_balance
  end

  def trial_balance_total(nominal_code)
    item = trial_balance.detect { |tb| tb['nominal_code'] == nominal_code.to_s }
    item['total']&.to_f || 0
  end

  def fa_client
    @fa_client ||= FreeagentClient.new(@user)
  end
end
