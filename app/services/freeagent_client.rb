class FreeagentClient
  include HTTParty

  base_uri ENV['FREEAGENT_BASE_URI']

  def initialize(auth_user)
    self.class.headers 'Accept': 'application/json'
    self.class.headers 'Content-Type': 'application/json'
    self.class.headers 'Authorization': "Bearer #{auth_user.current_auth_token}"
    self.class.headers 'User-Agent': 'Httparty'
  end

  def profit_and_loss_summary
    self.class.get(
      '/v2/accounting/profit_and_loss/summary'
    ).parsed_response['profit_and_loss_summary']
  end

  def bank_accounts
    self.class.get(
      '/v2/bank_accounts'
    ).parsed_response['bank_accounts']
  end

  def open_invoices
    self.class.get(
      '/v2/invoices?view=open'
    ).parsed_response['invoices']
  end

  def trial_balance
    self.class.get(
      calendar_year_date_range('/v2/accounting/trial_balance/summary')
    ).parsed_response['trial_balance_summary']
  end

  private

  def calendar_year_date_range(path)
    "#{path}?from_date=#{Date.today.beginning_of_year}&to_date=#{Date.today.end_of_year}"
  end
end
