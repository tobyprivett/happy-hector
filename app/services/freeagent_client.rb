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
end
