require 'freeagent_auth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider 'freeagent_auth',
           ENV['FREEAGENT_CLIENT_ID'],
           ENV['FREEAGENT_CLIENT_SECRET']
end
