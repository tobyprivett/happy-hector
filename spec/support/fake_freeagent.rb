require 'sinatra/base'

class FakeFreeagent < Sinatra::Base
  get '/v2/accounting/profit_and_loss/summary' do
    json_response 200, 'profit_and_loss_summary.json'
  end

  get '/v2/bank_accounts' do
    json_response 200, 'bank_accounts.json'
  end

  get '/v2/invoices' do
    json_response 200, 'open_invoices.json' if params['view'] == 'open'
  end

  get '/v2/accounting/trial_balance/summary' do
    json_response 200, 'trial_balance_summary.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
