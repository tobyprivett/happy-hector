module OmniAuth
  module Strategies
    class FreeagentAuth < OmniAuth::Strategies::OAuth2
      option :name, 'freeagent_auth'

      option :client_options,
             site: SSO_PROVIDER,
             authorize_url: 'https://api.freeagent.com/v2/authorize/',
             token_url: 'https://api.freeagent.com/v2/token_endpoint'

      uid do
        raw_info['id']
      end

      info do
        {
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          email: raw_info['email'].downcase
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('https://api.freeagent.com/v2/users/me').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
